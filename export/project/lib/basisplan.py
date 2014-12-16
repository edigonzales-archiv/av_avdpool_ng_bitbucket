# -*- coding: utf-8 -*-
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *

import sys
import os
import logging

class Basisplan:
    
    def __init__(self, settings):
        self.qgis_dir = settings.qgis_dir        
        self.project_dir = settings.project_dir
        self.target_dir = settings.target_dir
        self.dpi = settings.dpi
        self.colortype = settings.colortype
        self.restrict_tile = settings.restrict_tile
        self.scale = settings.scale
        self.canton = settings.canton
        self.restrict_tile = settings.restrict_tile
        self.clip = settings.clip
        self.tileindex = os.path.join("data", "basisplan_meta.gpkg")
        self.tileindex = os.path.join(self.project_dir, self.tileindex)
        self.antialiasing = settings.antialiasing
        
        if self.colortype == 'f':
            # Only RGB32 because if we do NOT clip there is no need
            # for an alpha channel.
            self.image_format = QImage.Format_RGB32
        else:
            self.image_format = QImage.Format_Mono
            
        overlap = str.split(settings.overlap)
        if len(overlap) == 1:
            self.overlapx = float(overlap[0])
            self.overlapy = float(overlap[0])
        elif len(overlap) == 2:
            self.overlapx = float(overlap[0])
            self.overlapy = float(overlap[1])
        else:
            self.overlapx = 100
            self.overlapy = 50
            
        # initialize qgis and open project file
        # self ist notwendig sonst, wird irgendwie nicht sauber initialisiert und fonts etc. wird nicht erkannt...
        self.app = QApplication(sys.argv)        
        QgsApplication.setPrefixPath(self.qgis_dir, True)
        QgsApplication.initQgis()

    def openProject(self, mode):
        if mode == 'l':
            self.mode = '_liegenschaften'
        else:
            self.mode = ''
            
        self.qgs = os.path.join("qgs", "bpav" + str(self.scale) + str(self.colortype) + self.mode + ".qgs")
        self.qgs = os.path.join(self.project_dir, self.qgs)
            
        QgsProject.instance().setFileName(self.qgs)

        if not QgsProject.instance().read():
            raise Exception("Error reading QGIS project file: " + self.qgs)

    def create_map_tiles(self):
        # get all layers in the qgis project file
        lst = []
        layerTreeRoot = QgsProject.instance().layerTreeRoot()
        for id in layerTreeRoot.findLayerIds():
            node = layerTreeRoot.findLayer(id)
            lst.append(id)
        logging.debug(lst)

        # get the layer with all possible the tiles that we need to generate (aka Tileindex/Blatteinteilung)
        layer_name =  "blatteinteilung_" + str(self.scale) + "_" + str(self.canton)
        vlayer = QgsVectorLayer(self.tileindex + "|layername=" + layer_name, "blatteinteilung_5000_"+str(self.canton), "ogr")
        if not vlayer.isValid():
            raise Exception("Could not load tileindex layer: " + str(layer_name))

        self.tile_found = False

        iter = vlayer.getFeatures()
        for feature in iter:
            idx = vlayer.fieldNameIndex('nummer')
            nummer = feature.attributes()[idx].toString() # Why .toString()? Another sip version?
            
            # base file path (no extension)
            base_file_path = os.path.join(self.target_dir, "bpav" + str(self.scale) + str(self.colortype) + "_" + str(nummer))
            logging.debug(base_file_path)
            
            # if there is a tile restriction, only create this tile
            if self.restrict_tile and nummer <> self.restrict_tile:
                continue
                
            if self.restrict_tile and nummer == self.restrict_tile:
                self.tile_found = True

            logging.debug("Creating tile number: " + str(nummer))

            # bbox / widht / height / filename etc.
            geom = feature.geometry()
            p1 = geom.vertexAt(0)
            p2 = geom.vertexAt(2)
            
            # apply overlap distance for better label handling
            rect = QgsRectangle(QgsPoint(p1.x() - self.overlapx, p1.y() - self.overlapy), QgsPoint(p2.x() + self.overlapx,  p2.y() + self.overlapy)) # wird normalisiert
            
            dx = rect.width()
            dy = rect.height()

            width = (dx/self.scale) / 0.0254 * self.dpi
            height = (dy/self.scale) / 0.0254 * self.dpi
            
            base_file_name = base_file_path + str(self.mode)
            logging.debug("Filename: " + str(base_file_name))
            
            # mapsettings for maprendererjob
            mapSettings = QgsMapSettings()
            mapSettings.setMapUnits(0)
            mapSettings.setExtent(rect)
            mapSettings.setOutputDpi(self.dpi)
            mapSettings.setOutputSize(QSize(width, height))
            mapSettings.setLayers(lst)
            # mapSettings.setFlags(QgsMapSettings.Antialiasing | QgsMapSettings.UseAdvancedEffects | QgsMapSettings.ForceVectorOutput | QgsMapSettings.DrawLabeling)
            # No antialiasing: smaller files and no quality loss when resambling enabled in QGIS / MapServer etc.
            # Faster rendering?
            # Really no quality loss in daily business?
            if self.antialiasing:
                mapSettings.setFlags(QgsMapSettings.Antialiasing | QgsMapSettings.UseAdvancedEffects | QgsMapSettings.DrawLabeling)
            else:
                mapSettings.setFlags(QgsMapSettings.UseAdvancedEffects | QgsMapSettings.DrawLabeling)

            # create image, render the scene and save image
            # Don't use QgsMapRendererSequentialJob. You get some errors because of not matching dpi values.
            img = QImage(QSize(width, height), self.image_format)
            img.setDotsPerMeterX(self.dpi / 25.4 * 1000)
            img.setDotsPerMeterY(self.dpi / 25.4 * 1000)
                
            p = QPainter()
            p.begin(img)
            
            mapRenderer = QgsMapRendererCustomPainterJob(mapSettings, p)
            mapRenderer.start()
            mapRenderer.waitForFinished()

            p.end()

            img.save(base_file_name + str(".png"), "png")
            logging.debug("Image saved.")

            # create worldfile
            res = dx/width
            with open(base_file_name + str(".pngw"), 'w') as outfile:
                outfile.write(str(res))
                outfile.write("\n")
                outfile.write("0.0")
                outfile.write("\n")
                outfile.write("0.0")
                outfile.write("\n")
                outfile.write(str(-1*res))
                outfile.write("\n")
                outfile.write(str(rect.xMinimum()+0.5*res))
                outfile.write("\n")
                outfile.write(str(rect.yMaximum()-0.5*res))
                outfile.close()
                logging.debug("Worldfile created.")

            # create geotiff with origin bbox, overviews etc.
            logging.debug("Postprocessing map tile:")
            projwin = "-projwin " + str(p1.x()) + " " + str(p2.y()) + " " + str(p2.x()) + " " + str(p1.y())
            if self.colortype == 'sw':
                cmd = "gdal_translate -of GTiff " + projwin + " -a_srs EPSG:21781 -mo TIFFTAG_XRESOLUTION=" + str(self.dpi) + " -co 'BLOCKXSIZE=512' -co 'BLOCKYSIZE=512' -mo TIFFTAG_YRESOLUTION=" + str(self.dpi) +  " -co 'NBITS=1' -co 'COMPRESS=CCITTFAX4' -co 'TILED=YES' " + base_file_name + ".png" + " " + base_file_name + ".tif"
                logging.debug(cmd)
                os.system(cmd)
                
                cmd = "gdaladdo -r nearest " + base_file_name + ".tif --config COMPRESS_OVERVIEW CCITTFAX4 --config GDAL_TIFF_OVR_BLOCKSIZE 512 2 4 8 16 32 64"
                logging.debug(cmd)
                os.system(cmd)

            else:
                if self.clip or self.mode == '_liegenschaften':
                    file_name = base_file_name + "_tmp.tif"
                else:
                    file_name = base_file_name + ".tif"
                    
                cmd = "gdal_translate -of GTiff " + projwin + " -a_srs EPSG:21781 -mo TIFFTAG_XRESOLUTION=" + str(self.dpi) + " -mo TIFFTAG_YRESOLUTION=" + str(self.dpi) +  " -co 'TILED=YES' -co 'BLOCKXSIZE=512' -co 'BLOCKYSIZE=512' -co 'COMPRESS=DEFLATE' -co 'PHOTOMETRIC=RGB' " + base_file_name + ".png" + " " + file_name
                logging.debug(cmd)
                os.system(cmd)
                
                # only when clipping is enabled but not necessery for real estates (they are transparent anyway)
                if self.clip and self.mode <> '_liegenschaften':
                    cmd = "gdalwarp -overwrite -wm 1024 -dstalpha -cutline " + os.path.join(self.target_dir, "kantonsgrenze_buffer.shp") + " -cl kantonsgrenze_buffer -co 'COMPRESS=DEFLATE' -co 'TILED=YES' -co 'ALPHA=YES' -co 'BLOCKXSIZE=512' -co 'BLOCKYSIZE=512' " + file_name  + " " + base_file_name + ".tif"
                    logging.debug(cmd)
                    os.system(cmd)
                    self.deleteFile(file_name)
                    
                # real estates are always transparent (white -> transparent)
                if self.mode == '_liegenschaften':
                    cmd = "gdalwarp -overwrite -wm 1024 -dstalpha -srcnodata '255 255 255' -co 'COMPRESS=DEFLATE' -co 'TILED=YES' -co 'ALPHA=YES' -co 'BLOCKXSIZE=512' -co 'BLOCKYSIZE=512' " + file_name  + " " + base_file_name + ".tif"
                    logging.debug(cmd)
                    os.system(cmd)
                    self.deleteFile(file_name)

                cmd = "gdaladdo -r nearest " + base_file_name + ".tif --config COMPRESS_OVERVIEW DEFLATE --config GDAL_TIFF_OVR_BLOCKSIZE 512 2 4 8 16 32 64"
                logging.debug(cmd)
                os.system(cmd)

            logging.debug(base_file_path + ".tif" + " created.")
            
            self.deleteFile(base_file_name + ".png")
            self.deleteFile(base_file_name + ".pngw")

        del vlayer

        if self.restrict_tile and not self.tile_found:
            raise Exception("Tile not found: " + str(self.restrict_tile))            

    def deleteFile(self, fname):
      try:
        os.remove(fname)
      except OSError as e:
        logging.error(fname + " could not be deleted: " + str(e))
      except Exception as e:
        logging.exception(e)
      else:
        logging.debug(fname + " deleted")

    def __del__(self):
        QgsApplication.exitQgis()

