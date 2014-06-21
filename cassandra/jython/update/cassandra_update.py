#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	cassandra_update.py
#					Sep/06/2013
#
# ----------------------------------------------------------------
#
import java
import sys
import string
from java.lang import	System
#
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_cassandra_manipulate import cassandra_update_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
#
key = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key, population_in))
#
#
str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

cassandra_update_proc(conn,key,population_in)

conn.close()

print ("*** 終了 ***")
#
# ----------------------------------------------------------------
