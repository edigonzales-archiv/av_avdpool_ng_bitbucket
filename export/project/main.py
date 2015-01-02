# -*- coding: utf-8 -*-
import os
import sys
import logging
import time
import datetime
import osgeo.gdal
from osgeo import ogr

from lib import Options
from lib import Settings
from lib import GeoPackage
from lib import SpatiaLite
from lib import Shapefile

ogr.UseExceptions() 

def get_deliveries(export_all):
    db_params = my_settings.db_params_delivery
    db_name = db_params["db_name"]
    db_host = db_params["db_host"]
    db_schema = db_params["db_schema"]
    db_table = db_params["db_table"]
    db_user = db_params["db_user"]
    db_pwd = db_params["db_pwd"]

    connString = "PG: host=%s dbname=%s user=%s password=%s" %(db_host, db_name, db_user, db_pwd)
    conn = ogr.Open(connString)
    
    bfsnr = []
    for i in conn:
        daLayer = i.GetName()
        if daLayer == db_schema + "." + db_table:
            lyr = conn.GetLayer(daLayer)
            if not export_all:
                lyr.SetAttributeFilter("lieferdatum = current_date")
            for feature in lyr:
                bfsnr.append(feature.GetField("gem_bfs"))
            break
    conn.Destroy()
    return bfsnr


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
    
    # get list of community numbers
    bfsnr = get_deliveries(my_settings.export_all)
    print bfsnr
    
    # Geopackage
    if my_settings.gpkg:
        logging.info("Start exporting GeoPackage...")
        
        if my_settings.lv03:
            logging.info("LV03")
            
            db_params  = my_settings.db_params_lv03
            target_dir = my_settings.gpkg_dir_lv03
            
            gpkg = GeoPackage(db_params, target_dir)
            gpkg.export_communities(bfsnr)
            
        if my_settings.lv95:
            logging.info("LV95")
            
            db_params  = my_settings.db_params_lv95
            target_dir = my_settings.gpkg_dir_lv95
            
            gpkg = GeoPackage(db_params, target_dir)
            gpkg.export_communities(bfsnr)
        
        logging.info("Export GeoPackage done.")
    
    # Spatialite
    if my_settings.spatialite:
        logging.info("Start exporting SpatiaLite...")
    
        if my_settings.lv03:
            logging.info("LV03")
            
            db_params  = my_settings.db_params_lv03
            target_dir = my_settings.spatialite_dir_lv03
            
            spatialite = SpatiaLite(db_params, target_dir)
            spatialite.export_communities(bfsnr)

        if my_settings.lv95:
            logging.info("LV95")
            
            db_params  = my_settings.db_params_lv95
            target_dir = my_settings.spatialite_dir_lv95
            
            spatialite = SpatiaLite(db_params, target_dir)
            spatialite.export_communities(bfsnr)

        logging.info("Export SpatiaLite done.")

    # Shapefile
    if my_settings.shp:
        logging.info("Start exporting Shapefile...")
    
        if my_settings.lv03:
            logging.info("LV03")
            
            db_params  = my_settings.db_params_lv03
            target_dir = my_settings.shp_dir_lv03
            
            shp = Shapefile(db_params, target_dir)
            shp.export_communities(bfsnr)

        if my_settings.lv95:
            logging.info("LV95")
            
            db_params  = my_settings.db_params_lv95
            target_dir = my_settings.shp_dir_lv95
            
            shp = Shapefile(db_params, target_dir)
            shp.export_communities(bfsnr)

        logging.info("Export Shapefile done.")

    
    
#    
#
#    # preprocess cadastral surveying data (e.g. generalize object names)
#    if my_settings.preprocess:
#        logging.info("Preprocessing cadastral data.")
#        p = Preprocessing(my_settings)
#        p.generalize_data()
#        p.create_clipping_polygon()
#        preprocessing_duration = datetime.datetime.now() - starttime
#        logging.info("Preprocessing finished. Duration: " + str(preprocessing_duration))
#    else:
#        preprocessing_duration = starttime
#        logging.info("No preprocessing of cadastral data.")
#
#    # generate the map tiles
#    try:
#        
#        bp = Basisplan(my_settings)
#        
#        if my_settings.mode == 's':
#            
#            logging.info("Generate Situation layer:")
#            bp.openProject('s')
#            bp.create_map_tiles()
#        
#        elif my_settings.mode == 'l':
#            logging.info("Generate Liegenschaften layer:")
#            
#            bp.openProject('l')
#            bp.create_map_tiles()
#            
#        elif my_settings.mode == 'b':
#            logging.info("Generate Situation layer.")
#            logging.info("Generate Liegenschaften layer:")
#    except Exception, e:
#        # better exception handling / create exceptions that fit my needs
#        logging.error(e)
#        sys.exit(e)
    
        
    overall_duration = datetime.datetime.now() - starttime
    logging.info("Task complete. Overall duration: " + str(overall_duration))
    logging.shutdown()

