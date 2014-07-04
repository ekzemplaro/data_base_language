#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/couch_delete.py
#
#					Jun/24/2014
#
# ----------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
from jython_get_uri import rest_delete_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
print (key)
#
host = "localhost:5984"
path = "/nagano/" + key
#
json_str = get_uri_proc (host,path)
#
print "len (str_buf) = %d\n" % len (json_str)
print json_str
#
unit_aa = json.loads (json_str)
if "error" in unit_aa:
	print ("*** not exist ***")
else:
	print ("_rev\t" + unit_aa["_rev"])
	print ("name\t" + unit_aa["name"])
	url_del = 'http://' + host + path + '?rev=' + unit_aa["_rev"] 
	rest_delete_proc (url_del)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
