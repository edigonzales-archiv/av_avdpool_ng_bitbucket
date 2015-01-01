# -*- coding: utf-8 -*-
import sys
import os
import logging

import osgeo.gdal
from osgeo import ogr

from lib import ExportData

class GeoPackage(ExportData):
    
    ####### könnte man noch SQLite draus machen. einfach driver, extension und creation options sind anders.
    
    def export_communities(self, export_all):
        connString = "PG: host=%s dbname=%s user=%s password=%s" %(self.db_host, self.db_name, self.db_user, self.db_pwd)
        conn = ogr.Open(connString)

        if export_all:
            bfsnr_list = self.get_all_deliveries()
        else:
            bfsnr_list = self.get_todays_deliveries()
        
        for bfsnr in bfsnr_list:
            print bfsnr
            out = os.path.join(self.target_dir, str(bfsnr) + ".gpkg")
            out_driver = ogr.GetDriverByName("GPKG")
            
            if os.path.exists(out):
                out_driver.DeleteDataSource(out)

            out_datasource = out_driver.CreateDataSource(out)

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

