#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_read.py
#
#					Dec/13/2010
# --------------------------------------------------------------
import	sys
#sys.path.append ("/mnt/sdb2/usr/lib/oracle/xe/app/oracle/product/10.2.0/client/lib")
#
import	cx_Oracle
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import	sql_display_proc
#
print ("*** 開始 ***")
#
conn = cx_Oracle.connect (u"scott/tiger@spn109:1521/xe")
#
cursor = conn.cursor ()

sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
#
print ("*** 終了 ***")
#
# --------------------------------------------------------------
