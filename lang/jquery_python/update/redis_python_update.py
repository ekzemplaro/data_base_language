#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_python_update.py
#
#						Dec/09/2014
#
#
import sys
import json
import	datetime
#
import	cgi
import	string
import	redis
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_update_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
# -------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
now = datetime.datetime.now ()
date_mod = '%s' % now
for it in range (len(array_bb)):
	key_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("key_in = %s<br />" % key_in)
	print ("population_in = %d<br />" % population_in)
#
	str_json = rr.get(key_in).decode ()
	unit_aa = json.loads (str_json)
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = date_mod
	json_str = json.dumps (unit_aa)
	rr.set(key_in, json_str)
#
#
print ("OK<br />")
#
# ---------------------------------------------------------------
