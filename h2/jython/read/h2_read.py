#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	h2_read.py
#					Jan/25/2011
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
from jython_rdb_manipulate import display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
#
database = "file:/var/tmp/h2/cities"
url="jdbc:h2:" + database
user = "SA"
password = ""

conn = DriverManager.getConnection (url,user, password)

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
