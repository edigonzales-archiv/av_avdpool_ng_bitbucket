# -*- coding: utf-8 -*-

from argparse import ArgumentParser

class Options:

    def __init__(self):
        self._init_parser()

    def _init_parser(self):
        usage = 'bin/export'
        self.parser = ArgumentParser(usage=usage)
        self.parser.add_argument('--lv03',
                                action = 'store_true',
                                default = True,
                                dest ='lv03',
                                help = "Export data in LV03.")

        self.parser.add_argument('--lv95',
                                action = 'store_true',
                                default = False,
                                dest ='lv95',
                                help = "Export data in LV95.")

        self.parser.add_argument('--gpkg',
                                action = 'store_true',
                                default = False,
                                dest ='gpkg',
                                help = "Export GeoPackage.")

        self.parser.add_argument('--spatialite',
                                action = 'store_true',
                                default = False,
                                dest ='spatialite',
                                help = "Export SpatiaLite.")

        self.parser.add_argument('--shp',
                                action = 'store_true',
                                default = False,
                                dest ='shp',
                                help = "Export Shapefile.")

        self.parser.add_argument('--all',
                                action = 'store_true',
                                default = False,
                                dest ='all',
                                help = "Export all communities.")

    def parse(self, args=None):
        return self.parser.parse_args(args)
