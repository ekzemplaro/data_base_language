#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	ftp_python_read.py
#
#						Aug/04/2014
#
#
# ---------------------------------------------------------------------
import	os
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
# ---------------------------------------------------------------------
#
os.environ["ftp_proxy"]=''
url_json = 'ftp://scott:tiger@host_dbase/city/iwate.json'
str_json = curl_get_proc (url_json)
#
#
#
print ("Content-type: text/json\n\n")
print (str (str_json,'UTF-8'))
