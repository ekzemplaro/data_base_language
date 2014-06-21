#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/webdav_update.py
#
#					Sep/12/2013
#
# ----------------------------------------------------------------
import	sys
import	httplib
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc

sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
from jython_get_uri import rest_put_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key, population_in))
#
host = "cddn007:3004"
path = "/city/tokyo.json"
url_json = 'http://' + host + path
#
json_str = get_uri_proc (host,path)
#
#
dict_aa = json.loads (json_str)
#
dict_bb=dict_update_proc (dict_aa,key,population_in)
#
str_json = json.dumps (dict_bb)
#
rest_put_proc (url_json,str_json,"text/json")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
