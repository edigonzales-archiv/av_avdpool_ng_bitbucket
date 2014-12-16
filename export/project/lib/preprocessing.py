# -*- coding: utf-8 -*-
import os
import logging
import math

class Preprocessing:
    
    def __init__(self, settings):
        self.project_dir =  settings.project_dir
        self.target_dir = settings.target_dir
        self.scale = settings.scale
        self.canton = settings.canton
        
    def generalize_data(self):
        cadastral_data = os.path.join(self.project_dir, "data/mopublic.gpkg")
        cmd = "ogr2ogr -overwrite -f GPKG " + cadastral_data + " -nln bodenbedeckung__bbtext_generalisiert -dialect INDIRECT_SQLITE -sql \"SELECT * FROM  bodenbedeckung__bbtext WHERE tid IN (SELECT tid FROM (SELECT b.tid, b.geom, b.nummer_name FROM bodenbedeckung__boflaeche as a, bodenbedeckung__bbtext as b WHERE art = \'Gewaesser_fliessendes\' AND a.tid = b.bbtext_von) as foo GROUP BY ST_X(ST_SnapToGrid(geom, 500)), ST_Y(ST_SnapToGrid(geom, 500)) ORDER BY ST_X(ST_SnapToGrid(geom, 500)), ST_Y(ST_SnapToGrid(geom, 500)), ST_Distance(geom, ST_SnapToGrid(geom, 500)))\" " + cadastral_data
        logging.debug(cmd)
        os.system(cmd)
        
    def create_clipping_polygon(self):
        # calculate buffer distance
        REFERENZMASSSTAB = 5000.0
        BREITE_MM_KANTONSGRENZE = 1.2
        buffer_distance = BREITE_MM_KANTONSGRENZE  * math.sqrt(REFERENZMASSSTAB / float(self.scale)) * float(self.scale) / 1000.0 / 2.0
    
        # buffer cantonal boundary
        boundary_data = os.path.join(self.project_dir, "data/administrative_grenzen.gpkg")
        cmd = "ogr2ogr -overwrite " + os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.shp") + " -dialect INDIRECT_SQLITE -sql 'SELECT 1 as ogc_fid, ST_Buffer(geom, " + str(buffer_distance) + ") FROM kantonsgrenzen WHERE KANTONSNUM = "+self.canton+"' " + boundary_data     
        logging.debug(cmd)
        os.system(cmd)
        
        # buffer country boundary
        cadastral_data = os.path.join(self.project_dir, "data/mopublic.gpkg")
        cmd = "ogr2ogr -append " + os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.shp") + " -dialect INDIRECT_SQLITE -sql 'SELECT 1 as ogc_fid, ST_Buffer(geom, " + str(buffer_distance * 2.0 / 1.2) + ") FROM hoheitsgrenzen__uebrigehoheitsgrenzen WHERE typ = \"Landesgrenzen\"' " + cadastral_data
        logging.debug(cmd)
        os.system(cmd)

        # union all geometries
        cmd = "ogr2ogr -overwrite " + os.path.join(self.target_dir, "kantonsgrenze_buffer.shp") + " -dialect SQLITE -sql 'SELECT 1 as ogc_fid, ST_Union(Geometry) FROM kantonsgrenze_buffer_tmp GROUP BY ogc_fid' " + os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.shp")      
        logging.debug(cmd)
        os.system(cmd)

        # delete tmp files
        self.deleteFile(os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.shp"))
        self.deleteFile(os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.shx"))
        self.deleteFile(os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.dbf"))
        self.deleteFile(os.path.join(self.target_dir, "kantonsgrenze_buffer_tmp.prj"))

    def deleteFile(self, fname):
      try:
        os.remove(fname)
      except OSError as e:
        logging.error(fname + " could not be deleted: " + str(e))
      except Exception as e:
        logging.exception(e)
      else:
        logging.debug(fname + " deleted")


