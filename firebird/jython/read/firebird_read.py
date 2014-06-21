#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	firebird_read.py
#					Jan/17/2011
#
# ----------------------------------------------------------------
#
import sys
import	string
from java.lang import	System
#
import java
from java.sql import	DriverManager
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")

java.lang.Class.forName("org.firebirdsql.jdbc.FBDriver")
#
database = "/var/tmp/firebird/cities.fdb"
url="jdbc:firebirdsql:localhost/3050:" + database
user = "sysdba"
password = "tiger"

conn = DriverManager.getConnection (url,user, password)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
