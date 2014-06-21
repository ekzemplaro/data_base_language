#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_read.py
#					May/30/2012
#
# --------------------------------------------------------
import sys
import kinterbasdb
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import sql_to_dict_proc
from text_manipulate import dict_display_proc
#
print ("*** 開始 ***")
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
			user="sysdba", password="tiger")
#			user="sysdba", password="masterkey",charset="utf-8")
#
cursor = conn.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
#
cursor.close ()
conn.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# --------------------------------------------------------
