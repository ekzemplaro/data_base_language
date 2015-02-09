#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	read/ftp_read.py
#
#					Jan/27/2015
#
# ----------------------------------------------------------------
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from curl_get import curl_get_proc
#
#
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
#
url_json = 'ftp://scott:tiger@cddn007/city/iwate.json'
str_tmp = curl_get_proc (url_json)
#
dict_aa = json.loads (str (str_tmp,'UTF-8'))
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
