# -*- coding: utf-8 -*-
import os
import sys
import logging
import time
import datetime

from lib import Options
from lib import Settings
from lib import Preprocessing
from lib import Basisplan

if __name__ == '__main__':    
    # read the options and arguments from the command line / and some more settings
    options = Options()
    opts = options.parse(sys.argv[1:])    
    my_settings = Settings(opts)
    
    # configure logging
    FORMAT = '%(asctime)s - %(levelname)s - %(message)s'
    logging.basicConfig(filename = my_settings.get_logfile_path(), filemode = "w", format = FORMAT, level = logging.DEBUG)
#    logging.getLogger().addHandler(logging.StreamHandler())

    # check if outdir (needed for creating the logfile) exists
    check_dir = my_settings.target_dir
    if not os.path.isdir(check_dir):
        errorMessage = "Error: " + check_dir + " does not exist"
        sys.exit(errorMessage)

    # log some general information
    logging.info("Creating bpav" + str(my_settings.scale) + my_settings.colortype + " at " + str(my_settings.dpi) + " dpi")
    logging.info("Settings: " + str(my_settings.__dict__))
    logging.info("Generating maps of canton: " + str(my_settings.canton).upper())
    starttime = datetime.datetime.now()    
    logging.info("Start time is " + str(starttime))

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

