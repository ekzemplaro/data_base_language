#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	drizzle_python_read.py
#
#						Jul/09/2012
#
# ----------------------------------------------------------------
import sys
import json
#
sys.path.append ("/var/www/data_base/common/python_common")
from drizzle_manipulate import drizzle_to_dict_proc
#
db_name = "city"
dict_aa = drizzle_to_dict_proc (db_name)
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
#	
