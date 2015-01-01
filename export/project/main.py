# -*- coding: utf-8 -*-
import os
import sys
import logging
import time
import datetime

from lib import Options
from lib import Settings
from lib import GeoPackage

if __name__ == '__main__':    
    # read the options and arguments from the command line / and some more settings
    options = Options()
    opts = options.parse(sys.argv[1:])    
    my_settings = Settings(opts)
    
    # configure logging
    FORMAT = '%(asctime)s - %(levelname)s - %(message)s'
    logging.basicConfig(filename = my_settings.get_logfile_path(), filemode = "w", format = FORMAT, level = logging.DEBUG)
#    logging.getLogger().addHandler(logging.StreamHandler())

    # log some general information
    logging.info("Settings: " + str(my_settings.__dict__))
    starttime = datetime.datetime.now()    
    logging.info("Start time is " + str(starttime))
    
    if my_settings.gpkg:
        logging.info("Start exporting GeoPackage...")
        
        if my_settings.lv03:
            db_params  = my_settings.db_params_lv03
            target_dir = my_settings.gpkg_dir_lv03
            
            gpkg = GeoPackage(db_params, target_dir)
            gpkg.export_communities(my_settings.export_all)
            
        if my_settings.lv95:
            db_params  = my_settings.db_params_lv95
            target_dir = my_settings.gpkg_dir_lv95
            
            gpkg = GeoPackage(db_params, target_dir)
            gpkg.export_communities(my_settings.export_all)
        
        logging.info("Export GeoPackage done.")
    
    if my_settings.spatialite:
        logging.info("Start exporting SpatiaLite...")


        logging.info("Export SpatiaLite done.")

    sys.exit()

    # preprocess cadastral surveying data (e.g. generalize object names)
    if my_settings.preprocess:
        logging.info("Preprocessing cadastral data.")
        p = Preprocessing(my_settings)
        p.generalize_data()
        p.create_clipping_polygon()
        preprocessing_duration = datetime.datetime.now() - starttime
        logging.info("Preprocessing finished. Duration: " + str(preprocessing_duration))
    else:
        preprocessing_duration = starttime
        logging.info("No preprocessing of cadastral data.")

    # generate the map tiles
    try:
        
        bp = Basisplan(my_settings)
        
        if my_settings.mode == 's':
            
            logging.info("Generate Situation layer:")
            bp.openProject('s')
            bp.create_map_tiles()
        
        elif my_settings.mode == 'l':
            logging.info("Generate Liegenschaften layer:")
            
            bp.openProject('l')
            bp.create_map_tiles()
            
        elif my_settings.mode == 'b':
            logging.info("Generate Situation layer.")
            logging.info("Generate Liegenschaften layer:")
    except Exception, e:
        # better exception handling / create exceptions that fit my needs
        logging.error(e)
        sys.exit(e)
    
        
    overall_duration = datetime.datetime.now() - starttime
    logging.info("Task complete. Overall duration: " + str(overall_duration))
    logging.shutdown()

