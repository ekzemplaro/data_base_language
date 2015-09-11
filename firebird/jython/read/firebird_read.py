#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	firebird_read.py
#					Aug/28/2015
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
user = "sysdba"
password = "tiger"
database = "/var/tmp/firebird/cities.fdb"

url="jdbc:firebirdsql:host_firebird:" + database

conn = DriverManager.getConnection (url,user, password)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
