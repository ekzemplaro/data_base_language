#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/couch_update.py
#
#					May/28/2015
#
# ----------------------------------------------------------------
import	sys
import string
import json
from time import localtime,strftime
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
from jython_get_uri import rest_put_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key, population_in))
#
host = "localhost:5984"
path = "/nagano/" + key
url_json = 'http://' + host + path
#
json_str = get_uri_proc (host,path)
#
unit_aa = json.loads (json_str)
if "error" in unit_aa:
	print ("*** not exist ***")
else:
	print ("_rev\t" + unit_aa["_rev"])
	print ("name\t" + unit_aa["name"])
#
	unit_aa["population"] = population_in
	today = strftime ("%Y-%m-%d",localtime ())
	unit_aa["date_mod"] = today
	str_json_new = json.dumps (unit_aa)
	print (str_json_new)
	rest_put_proc (url_json,str_json_new,"text/json")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
