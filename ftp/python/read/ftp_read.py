#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	read/ftp_read.py
#
#					Nov/30/2016
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
sys.stderr.write ("*** 開始 ***\n")
#
url_json = 'ftp://scott:tiger@host_dbase/city/iwate.json'
str_tmp = curl_get_proc (url_json)
#
dict_aa = json.loads (str (str_tmp,'UTF-8'))
dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# ----------------------------------------------------------------
