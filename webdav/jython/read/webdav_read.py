#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	read/webdav_read.py
#
#					Oct/31/2013
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	httplib
import	json
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import get_uri_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
host = "host_dbase:3004"
path = "/city/tokyo.json"
json_str = get_uri_proc (host,path)
#
dict_aa = json.loads (json_str)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
