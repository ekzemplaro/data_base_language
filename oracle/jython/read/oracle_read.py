#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	oracle_read.py
#					Aug/06/2015
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
print ("*** 開始 ***")

host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe"
#
conn = DriverManager.getConnection (str_connect,user,password)

display_proc (conn)

conn.close()

print ("*** 終了 ***")
#
# ----------------------------------------------------------------
