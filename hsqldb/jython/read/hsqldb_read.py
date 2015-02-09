#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	hsqldb_read.py
#					Nov/29/2010
#
# ----------------------------------------------------------------
#
import sys
import	string
from java.lang import	*
#
import java
from java.sql import *
from java.io  import *
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")

java.lang.Class.forName("org.hsqldb.jdbcDriver")

#
str_connect = "jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true"
#
conn = DriverManager.getConnection(str_connect,"SA", "")

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
