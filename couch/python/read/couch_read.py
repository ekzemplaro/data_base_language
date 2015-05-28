#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	read/couch_read.py
#
#					May/06/2015
#
# ----------------------------------------------------------------
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from curl_get import curl_get_proc
#
from couch_manipulate import couch_to_dict_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
os.environ["http_proxy"]=''
#
url_json = 'http://localhost:5984/nagano'
str_json = curl_get_proc (url_json + "/" + "_all_docs?include_docs=true")
list_aa = json.loads (str (str_json,'UTF-8'))
#
dict_aa = couch_to_dict_proc (url_json)
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
