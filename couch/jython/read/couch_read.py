#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	read/couch_read.py
#
#					Jun/24/2014
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
#
import	json
# ----------------------------------------------------------------
#sys.path.append ('/var/www/data_base/common/python_common')
#from text_manipulate import dict_display_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
host = "localhost:5984"
collection = "/nagano"
path = collection + "/_all_docs"
json_str = get_uri_proc (host,path)
#
list_aa = json.loads (json_str)
print (list_aa["total_rows"])
if ('rows' in list_aa):
	for it in list_aa['rows']:
		key_aa = it['key']
		str_tmp = get_uri_proc (host,collection + "/" + key_aa)
#
		unit_aa = json.loads (str_tmp)
		str_out = key_aa + '\t' +  unit_aa['name']
		str_out += '\t%d' %  unit_aa['population']
		str_out += '\t' +  unit_aa['date_mod']
		print (str_out)
else:
	print ("*** db not exist. ***")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
