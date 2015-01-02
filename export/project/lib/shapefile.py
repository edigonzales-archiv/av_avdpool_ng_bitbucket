# -*- coding: utf-8 -*-
import sys
import os
import logging
import tempfile
import zipfile
import shutil

import osgeo.gdal
from osgeo import ogr

from lib import ExportFormat

class Shapefile(ExportFormat):

    def __init__(self, db_params,  target_dir):
        ogr.UseExceptions() 
        
        self.db_name = db_params["db_name"]
        self.db_host = db_params["db_host"]
        self.db_port = db_params["db_port"]
        self.db_schema = db_params["db_schema"]
        self.db_user = db_params["db_user"]
        self.db_pwd = db_params["db_pwd"]

        self.target_dir = target_dir        
            
    def export_communities(self, bfsnr_list):
        connString = "PG: host=%s dbname=%s user=%s password=%s" %(self.db_host, self.db_name, self.db_user, self.db_pwd)
        conn = ogr.Open(connString)
        
        for bfsnr in bfsnr_list:
            logging.info("BFS-Nummer: " + str(bfsnr))
            
            temp_dir = tempfile.mkdtemp()
            
            out_zip = os.path.join(self.target_dir, str(bfsnr) + ".zip")
        
            outDriver = ogr.GetDriverByName("ESRI Shapefile")
        
            for i in conn:
                daLayer = i.GetName()
                schema = daLayer.split(".")[0]
                layerName = daLayer.split(".")[1]
                if schema == self.db_schema:
                    inLayer = conn.GetLayer(daLayer)   
                    inLayer.SetAttributeFilter("bfsnr = " + str(bfsnr))  

                    out = os.path.join(temp_dir, layerName + ".shp")
                    
                    if os.path.exists(out):
                        outDriver.DeleteDataSource(out)
                        
                    #outDatasource = outDriver.CreateDataSource('/vsizip/tmp/'+str(bfsnr)+'.zip/' + layerName + ".shp")                               
                    outDatasource = outDriver.CreateDataSource(out)       
                    
                    outLayer = outDatasource.CreateLayer(layerName, srs = inLayer.GetSpatialRef(), geom_type=inLayer.GetLayerDefn().GetGeomType())
                    inLayerDefn = inLayer.GetLayerDefn()
                    
                    # Truncate field names manually. Python stalls when using "CopyLayer" or when explicitly trying to create a field with more then 10 characters.
                    truncate_field_names =  {}
                    j = 1
                    for m in range(inLayerDefn.GetFieldCount()):
                        field_name = inLayerDefn.GetFieldDefn(m).GetName()        
                        truncate_field_name = field_name[:10]
                        
                        try:
                            truncate_field_names[truncate_field_name]
                            truncate_field_name = truncate_field_name[:8] + "_" + str(j)
                            j += 1
                            truncate_field_names[truncate_field_name] = truncate_field_name
                        except KeyError:
                            truncate_field_names[truncate_field_name] = truncate_field_name
                        
                        outLayer.CreateField(ogr.FieldDefn(truncate_field_name, inLayerDefn.GetFieldDefn(m).GetType()))
                        
                    inFeature = inLayer.GetNextFeature()
                    while inFeature is not None:                        
                        outLayerDefn = outLayer.GetLayerDefn()
                        outFeature = ogr.Feature(outLayerDefn)
                        
                        # Add input Layer Fields to the output Layer.
                        for i in range(0, outLayerDefn.GetFieldCount()):
                            outFeature.SetField(outLayerDefn.GetFieldDefn(i).GetNameRef(), inFeature.GetField(i))

                        # Set Geometry
                        geom = inFeature.GetGeometryRef()
                        outFeature.SetGeometry(geom)
                        
                        # Add new Feature to output Layer.
                        outLayer.CreateFeature(outFeature)

                        inFeature = inLayer.GetNextFeature()
                        
                    outDatasource.Destroy()
                
            # Zip tempory directory with all the shapefiles and delete it.
            self.zip_files(temp_dir, out_zip)
            try:
                shutil.rmtree(temp_dir)  
            except OSError as exc:
                logging.error("Could not delete temporary directory: " + str(temp_dir))

        conn.Destroy()

    def zip_files(self, path, dst, arcname=None):
        zip_ = zipfile.ZipFile(dst, 'w')

        for root, dirs, files in os.walk(path):            
            for file in files:
                if arcname is None:
                    zip_.write(os.path.join(root, file), os.path.basename(file), compress_type = zipfile.ZIP_DEFLATED)
                else:
                    zip_.write(os.path.join(root, file), file, compress_type = zipfile.ZIP_DEFLATED)

        zip_.close()
