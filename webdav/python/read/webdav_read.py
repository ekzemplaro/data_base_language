#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	webdav_read.py
#
#					Mar/18/2013
#
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from curl_get import curl_get_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
#
url_json = 'http://host_dbase:3004/city/tokyo.json'
str_json = curl_get_proc (url_json)


dict_aa = json.loads (str_json)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
