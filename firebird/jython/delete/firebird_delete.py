#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	firebird_delete.py
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
from jython_rdb_manipulate import delete_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
java.lang.Class.forName("org.firebirdsql.jdbc.FBDriver")
#
user = "sysdba"
password = "tiger"
database = "/var/tmp/firebird/cities.fdb"

url="jdbc:firebirdsql:host_firebird:" + database

conn = DriverManager.getConnection (url,user, password)
delete_proc	(conn,id_in)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
