#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mssql_update.py
#					Jan/17/2013
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
from jython_rdb_manipulate import display_proc,update_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
url="jdbc:sqlserver://host_mssql;databaseName=city;"
user = "sa"
password = "scott_tiger"

conn = DriverManager.getConnection (url,user, password)
update_proc	(conn,id_in,population_in)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
