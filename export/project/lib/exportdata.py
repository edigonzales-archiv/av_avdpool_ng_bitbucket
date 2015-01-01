# -*- coding: utf-8 -*-
import sys
import os
import logging

import osgeo.gdal
from osgeo import ogr

class ExportData(object):
    
    def __init__(self, db_params,  target_dir):
        ogr.UseExceptions() 
        
        self.delivery_db_host = "localhost"
        self.delivery_db_name = "rosebud2"
        self.delivery_db_schema = "av_avdpool_ch"
        self.delivery_db_layer = "gemeindegrenzen_gemeindegrenze"
        
        self.db_name = db_params["db_name"]
        self.db_host = db_params["db_host"]
        self.db_port = db_params["db_port"]
        self.db_schema = db_params["db_schema"]
        self.db_user = db_params["db_user"]
        self.db_pwd = db_params["db_pwd"]

        self.target_dir = target_dir
        
    def get_all_deliveries(self):
        connString = "PG: host=%s dbname=%s user=%s password=%s" %(self.delivery_db_host, self.delivery_db_name, self.db_user, self.db_pwd)
        conn = ogr.Open(connString)
        
        bfsnr = []
        for i in conn:
            daLayer = i.GetName()
            if daLayer == self.delivery_db_schema + "." + self.delivery_db_layer:
                lyr = conn.GetLayer(daLayer)
                for feature in lyr:
                    bfsnr.append(feature.GetField("gem_bfs"))
                break
        conn.Destroy()
        return bfsnr

    def get_todays_deliveries(self):
        connString = "PG: host=%s dbname=%s user=%s password=%s" %(self.delivery_db_host, self.delivery_db_name, self.db_user, self.db_pwd)
        conn = ogr.Open(connString)
        
        bfsnr = []
        for i in conn:
            daLayer = i.GetName()
            if daLayer == self.delivery_db_schema + "." + self.delivery_db_layer:
                lyr = conn.GetLayer(daLayer)
                lyr.SetAttributeFilter("lieferdatum = current_date")
                for feature in lyr:
                    bfsnr.append(feature.GetField("gem_bfs"))
                break
        conn.Destroy()
        return bfsnr
