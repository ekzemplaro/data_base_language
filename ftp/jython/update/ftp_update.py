#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	ftp_update.py
#
#					Feb/25/2013
#
# -------------------------------------------------------------
from ftplib import FTP
import	sys
import	os
import	json
import	string
# -------------------------------------------------------------
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_file_io import file_to_str_proc
from jython_ftp_manipulate import ftp_get_proc
from jython_ftp_manipulate import ftp_put_proc
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
#
#
# -------------------------------------------------------------
print	("*** 開始 ***")
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
server='host_dbase'
user='scott'
passwd='tiger'
path='city/iwate.json'
#
json_str = ftp_get_proc (server,user,passwd,path)
#
dict_aa = json.loads(json_str)
#
dict_update_proc (dict_aa,id_in,population_in)
#
json_str = json.dumps (dict_aa)
#
ftp_put_proc (server,user,passwd,path,json_str)
#
print	("*** 終了 ***")
# -------------------------------------------------------------
