#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	db2_python_read.py
#
#						Mar/22/2010
#
#
import sys
import json
import ibm_db
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from db2_disp import db2_to_json_proc
#
conn = ibm_db.connect ('cities','','');
#
#
db2_to_json_proc (conn);
# conn.close ()
#
#
