#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	read/ftp_read.py
#
#					Oct/31/2013
#
# ----------------------------------------------------------------
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
from ftplib import FTP
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from curl_get import curl_get_proc
#
from file_io import file_to_str_proc
from ftp_manipulate import ftp_read_proc
#
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
#
url_json = 'ftp://scott:tiger@host_dbase/city/iwate.json'
#str_tmp = curl_get_proc (url_json)
str_tmp = ftp_read_proc ("host_dbase","scott","tiger","city/iwate.json")

print (str_tmp)

dict_aa = json.loads (str_tmp)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
