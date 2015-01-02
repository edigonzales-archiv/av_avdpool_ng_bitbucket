# -*- coding: utf-8 -*-
import sys
import os
import logging

import osgeo.gdal
from osgeo import ogr

from lib import ExportFormat

class SpatiaLite(ExportFormat):

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

            out = os.path.join(self.target_dir, str(bfsnr) + ".sqlite")
            out_driver = ogr.GetDriverByName("SQLite")
            
            if os.path.exists(out):
                out_driver.DeleteDataSource(out)

            out_datasource = out_driver.CreateDataSource(out, options=['SPATIALITE=yes'])

            for i in conn:
                daLayer = i.GetName()
                schema = daLayer.split(".")[0]
                layerName = daLayer.split(".")[1]
                if schema == self.db_schema:
                    lyr = conn.GetLayer(daLayer)   
                    lyr.SetAttributeFilter("bfsnr = " + str(bfsnr))                    
                    out_layer = out_datasource.CopyLayer(lyr, layerName)

            out_datasource.Destroy()
        conn.Destroy()

