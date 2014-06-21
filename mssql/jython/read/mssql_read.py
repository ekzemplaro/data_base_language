#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mssql_read.py
#					Jan/17/2013
#
# ----------------------------------------------------------------
import sys
from java.lang import	System
#
import java
from java.sql import DriverManager
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
#
url="jdbc:sqlserver://host_mssql;databaseName=city;"
user = "sa"
password = "scott_tiger"

conn = DriverManager.getConnection (url,user, password)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
