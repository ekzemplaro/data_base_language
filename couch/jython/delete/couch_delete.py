#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/couch_delete.py
#
#					Oct/31/2013
#
# ----------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	httplib
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
from jython_get_uri import rest_put_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key = sys.argv[1]
print (key)
#
#host = "host_dbase:5984"
host = "cddn007:5984"
path = "/city/cities"
#
json_str = get_uri_proc (host,path)
#
print "len (str_buf) = %d\n" % len (json_str)
#
dict_aa = json.loads (json_str)
print ("_rev\t" + dict_aa["_rev"])
#
if key in dict_aa:
	del dict_aa[key]
#
dict_display_proc (dict_aa)
#
str_json = json.dumps (dict_aa)
#
uri = 'http://' + host + path + '?rev=' + dict_aa["_rev"] 
#uri = 'http://' + host + path
print ("uri = " + uri)
rest_put_proc (uri,str_json,"text/json")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
