#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	read/ftp_read.py
#
#					Jun/21/2012
#
# -------------------------------------------------------------
from ftplib import FTP
import	sys
import	os
import	json
reload(sys)
sys.setdefaultencoding("utf-8")
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_ftp_manipulate import ftp_get_proc
#
# -------------------------------------------------------------
print	("*** 開始 ***")
#
json_str = ftp_get_proc ('host_dbase','scott','tiger','city/iwate.json')
#
dict_aa = json.loads (json_str)
#print json_str
dict_display_proc (dict_aa)
#
#
print	("*** 終了 ***")
# -------------------------------------------------------------
