#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	maria_read.py
#					May/23/2014
#
# ----------------------------------------------------------------
#
import sys
from java.lang import	System
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")

#
url="jdbc:mysql://localhost/city"
user = "scott"
password = "tiger"

conn = DriverManager.getConnection (url,user, password)

display_proc (conn)

conn.close()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
