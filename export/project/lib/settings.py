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
        self.sqlite_dir_lv03 = "/home/stefan/tmp/sqlite_lv03/"

        # path to spatialite (LV95)
        self.sqlite_dir_lv95 = "/home/stefan/tmp/sqlite_lv95/"

        # path to shapefile (LV03)
        self.shp_dir_lv03 = "/home/stefan/tmp/shp_lv03/"

        # path to shapefile (LV95)
        self.shp_dir_lv95 = "/home/stefan/tmp/shp_lv95/"
        
        # db parameters 
        self.db_params_lv03 = {'db_name': 'rosebud2',  'db_host': 'localhost',  'db_port': 5432, 'db_schema': 'av_mopublic',  'db_user': 'mspublic',  'db_pwd': 'mspublic'}
        self.db_params_lv95 = {'db_name': 'strelnikow',  'db_host': 'localhost',  'db_port': 5432, 'db_schema': 'av_mopublic',  'db_user': 'mspublic',  'db_pwd': 'mspublic'}

        
        # path to qgis dir
        self.qgis_dir = "/home/stefan/Apps/qgis_master"
        
        # all project files (geopackages and rasterlite and qgs) in the same root project directory. 
        self.project_dir = "/home/stefan/stefan.ziegler.de@gmail.com/Projekte/av_basisplan_ng/"
        
        # directory to save tiles to
        self.target_dir = opts.targetdir
        
        # resolution (dpi) to generate the tiles at
        self.dpi = opts.dpi
        
        # scale of the map
        self.scale = opts.scale
        
        # color or black/white map
        self.colortype = opts.colortype
        
        # don't clip the output to a specific geometry
        self.clip = opts.clip
        
        # generate situation, real estate or both layer
        self.mode = opts.mode
        
        # only generate specific tile
        self.restrict_tile = opts.restrict_tile
        
        # overlap in x an y direction
        self.overlap = opts.overlap
        
        # canton to produce maps from
        self.canton = opts.canton

    def get_logfile_path(self):
        return os.path.join("/home/stefan/tmp/",  "mopublic_export.log") 


