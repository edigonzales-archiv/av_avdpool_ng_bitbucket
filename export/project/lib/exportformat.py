# -*- coding: utf-8 -*-
import sys
import os
import logging

import osgeo.gdal
from osgeo import ogr

class ExportFormat(object):
    
    def __init__(self, db_params,  target_dir):
        ogr.UseExceptions() 
        
        self.db_name = db_params["db_name"]
        self.db_host = db_params["db_host"]
        self.db_port = db_params["db_port"]
        self.db_schema = db_params["db_schema"]
        self.db_user = db_params["db_user"]
        self.db_pwd = db_params["db_pwd"]

        self.target_dir = target_dir
