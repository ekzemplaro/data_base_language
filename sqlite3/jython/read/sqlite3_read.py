#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	sqlite3_read.py
#					Jan/12/2011
#
# ----------------------------------------------------------------
#
import	sys
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

java.lang.Class.forName("org.sqlite.JDBC")
#
sqlite3_file = "/var/tmp/sqlite3/cities.db"

url="jdbc:sqlite:" + sqlite3_file
user = ""
password = ""

conn = DriverManager.getConnection (url,user, password)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
