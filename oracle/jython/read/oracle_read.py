#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	oracle_read.py
#					Jan/14/2011
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

java.lang.Class.forName("oracle.jdbc.driver.OracleDriver")

#
url="jdbc:oracl:thin:@spn109:1521/xe"
user = "scott"
password = "tiger"

conn = DriverManager.getConnection (url,user,password)

display_proc (conn)

conn.close()

print ("*** 終了 ***")
#
# ----------------------------------------------------------------
