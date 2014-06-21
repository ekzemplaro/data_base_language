#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	derby_delete.py
#					Oct/01/2012
#
# ----------------------------------------------------------------
#
import sys
import	string
from java.lang import	System
#
import java
from java.sql import DriverManager
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc,delete_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
url="jdbc:derby://localhost:1527/city_aaa;create=true"

conn = DriverManager.getConnection (url)
delete_proc	(conn,id_in)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
