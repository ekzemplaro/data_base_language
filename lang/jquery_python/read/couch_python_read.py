#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	couch_python_read.py
#
#						May/06/2015
#
# ---------------------------------------------------------------------
import	os
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
# from curl_get import curl_get_proc
# from text_manipulate import dict_append_proc
from couch_manipulate import couch_to_dict_proc
#
# ---------------------------------------------------------------------
print ("Content-type: text/json\n\n")

os.environ["http_proxy"]=''
url_json = 'http://localhost:5984/nagano'
#
dict_aa = couch_to_dict_proc (url_json)
out_str_aa = json.dumps (dict_aa)
print (out_str_aa)
#
# ---------------------------------------------------------------------
