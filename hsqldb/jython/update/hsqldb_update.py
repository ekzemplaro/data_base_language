#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	hsqldb_update.py
#					Jun/02/2011
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
java.lang.Class.forName("org.hsqldb.jdbcDriver")

#
database = "file:/var/tmp/hsqldb/cities;shutdown=true"
url="jdbc:hsqldb:" + database
user = "SA"
password = ""

conn = DriverManager.getConnection (url,user, password)
update_proc	(conn,id_in,population_in)
display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
