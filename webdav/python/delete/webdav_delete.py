#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	webdav_delete.py
#
#					Mar/18/2013
# ----------------------------------------------------------------
import	os
import sys
import string
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from curl_get import curl_get_proc
from curl_get import curl_put_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
url_json = 'http://host_dbase:3004/city/tokyo.json'
#
str_buf_aa = curl_get_proc (url_json)
#
print ("len (str_buf) = %d\n" % len (str_buf_aa))
#
dict_aa = json.loads (str (str_buf_aa,'UTF-8'))
#
dict_bb = dict_delete_proc (dict_aa,id_in)
#
out_str = json.dumps (dict_bb)
#
curl_put_proc (url_json,out_str)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
