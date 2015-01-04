#!/bin/bash

DB_NAME="rosebud2"

sudo -u postgres psql -d $DB_NAME -f lv03/01_create_schema.sql
sudo -u postgres psql -d $DB_NAME -f lv03/02_create_tables.sql
sudo -u postgres psql -d $DB_NAME -f lv03/03_create_views.sql
