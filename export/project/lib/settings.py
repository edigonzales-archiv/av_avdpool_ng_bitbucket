# -*- coding: utf-8 -*-

import os

class Settings:

    def __init__(self, opts):
        # export all communities
        self.export_all = opts.all
        
        # path to gpkg (LV03)
        self.gpkg_lv03_dir = "/home/stefan/tmp/gpkg_lv03/"
        
        # path to gpkg (LV95)
        self.gpkg_lv95_dir = "/home/stefan/tmp/gpkg_lv95/"
        
        # path to spatialite (LV03)
        self.sqlite_lv03_dir = "/home/stefan/tmp/sqlite_lv03/"

        # path to spatialite (LV95)
        self.sqlite_lv95_dir = "/home/stefan/tmp/sqlite_lv95/"

        
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
        
        # preprocess cadastral data
        self.preprocess = opts.preprocess
        
        # generate antialiased maps
        self.antialiasing = opts.antialiasing 
        
        
    def get_logfile_path(self):
        return os.path.join(self.target_dir, "bpav" + str(self.scale) + str(self.colortype) + ".log") 


