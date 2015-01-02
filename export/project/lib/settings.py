# -*- coding: utf-8 -*-

import os

class Settings:

    def __init__(self, opts):
        # export all communities
        self.export_all = opts.all
        
        # export LV03
        self.lv03 = opts.lv03
        
        # export LV95
        self.lv95 = opts.lv95
        
        # export gpkg
        self.gpkg = opts.gpkg
        
        # export spatialite
        self.spatialite = opts.spatialite

        # export shapefile
        self.shp = opts.shp

        # path to gpkg (LV03)
        self.gpkg_dir_lv03 = "/home/stefan/tmp/gpkg_lv03/"
        
        # path to gpkg (LV95)
        self.gpkg_dir_lv95 = "/home/stefan/tmp/gpkg_lv95/"
        
        # path to spatialite (LV03)
        self.spatialite_dir_lv03 = "/home/stefan/tmp/sqlite_lv03/"

        # path to spatialite (LV95)
        self.spatialite_dir_lv95 = "/home/stefan/tmp/sqlite_lv95/"

        # path to shapefile (LV03)
        self.shp_dir_lv03 = "/home/stefan/tmp/shp_lv03/"

        # path to shapefile (LV95)
        self.shp_dir_lv95 = "/home/stefan/tmp/shp_lv95/"
        
        # db parameters 
        self.db_params_lv03 = {'db_name': 'rosebud2',  'db_host': 'localhost',  'db_port': 5432, 'db_schema': 'av_mopublic',  'db_user': 'mspublic',  'db_pwd': 'mspublic'}
        self.db_params_lv95 = {'db_name': 'strelnikow',  'db_host': 'localhost',  'db_port': 5432, 'db_schema': 'av_mopublic',  'db_user': 'mspublic',  'db_pwd': 'mspublic'}
        self.db_params_delivery = {'db_name': 'rosebud2',  'db_host': 'localhost',  'db_port': 5432, 'db_schema': 'av_avdpool_ch',  'db_table': 'gemeindegrenzen_gemeindegrenze',  'db_user': 'mspublic',  'db_pwd': 'mspublic'}

    def get_logfile_path(self):
        return os.path.join("/home/stefan/tmp/",  "mopublic_export.log") 


