#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	derby_read.py
#					Oct/01/2012
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
url="jdbc:derby://localhost:1527/city_aaa;create=true"

conn = DriverManager.getConnection (url);

display_proc (conn)
#
conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
