#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	python_proxy_get.py
#
#					Oct/30/2014
#
# ----------------------------------------------------------------
import os
import sys
import pycurl
import json
import cgi
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from curl_get import curl_get_proc
#
# ----------------------------------------------------------------
# print ("Content-type: text/plain; charset=UTF-8\n\n")
print ("Content-type: text/json; charset=UTF-8\n\n")

# print ("*** 開始 ***")
#
os.environ["http_proxy"]=''
#
# print (os.environ['REQUEST_METHOD'])
#
form = cgi.FieldStorage()
url = form["url"].value
#
#
str_json = str (curl_get_proc (url),'UTF-8')
print (str_json);
#
# print ("*** 終了 ***")
# ----------------------------------------------------------------
