#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/webdav_delete.py
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
host = "cddn007:3004"
path = "/city/tokyo.json"
#
json_str = get_uri_proc (host,path)
#
print "len (str_buf) = %d\n" % len (json_str)
#
dict_aa = json.loads (json_str)
#
if key in dict_aa:
	del dict_aa[key]
	dict_display_proc (dict_aa)
	str_json = json.dumps (dict_aa)
	url_target = 'http://' + host + path
	print ("url_target = " + url_target)
	rest_put_proc (url_target,str_json,"text/json")
#
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
