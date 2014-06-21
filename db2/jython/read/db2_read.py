#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	db2_read.py
#					Jun/09/2011
#
# ----------------------------------------------------------------
#
import sys
from java.lang import	System
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")


java.lang.Class.forName("COM.ibm.db2.jdbc.app.DB2Driver")

url = "jdbc:db2:cities"

user = "scott"
password = "tiger"

conn = DriverManager.getConnection(url,user,password)

display_proc(conn)

conn.close()

print ("*** 終了 ***")

# ---------------------------------------------------------------------
