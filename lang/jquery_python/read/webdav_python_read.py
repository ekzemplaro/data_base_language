#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	webdav_python_read.py
#
#						Aug/04/2014
#
#
# ---------------------------------------------------------------------
import	os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
# ---------------------------------------------------------------------
print ("Content-type: text/json\n\n")

os.environ["http_proxy"]=''
url_json = 'http://host_dbase:3004/city/tokyo.json'
str_json = curl_get_proc (url_json)

print (str (str_json,'UTF-8'))
#
# ---------------------------------------------------------------------
