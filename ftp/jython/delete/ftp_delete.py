#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	ftp_delete.py
#
#					Feb/25/2013
#
# -------------------------------------------------------------
from ftplib import FTP
import	sys
import	os
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_file_io import file_to_str_proc
from jython_ftp_manipulate import ftp_get_proc
from jython_ftp_manipulate import ftp_put_proc
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
#
# -------------------------------------------------------------
print	("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
server='host_dbase'
user='scott'
passwd='tiger'
path='city/iwate.json'
#
json_str = ftp_get_proc (server,user,passwd,path)
#
dict_aa = json.loads (json_str)
#
dict_aa = dict_delete_proc (dict_aa,id_in)
#
json_str = json.dumps (dict_aa)
#
ftp_put_proc (server,user,passwd,path,json_str)
#
print	("*** 終了 ***")
# -------------------------------------------------------------
