#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	cassandra_read.py
#					Sep/06/2013
#
# ----------------------------------------------------------------
#
import sys
from java.lang import	System
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_cassandra_manipulate import cassandra_to_dict_proc
from jython_text_manipulate import jython_dict_display_proc
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")

#
str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

dict_aa = cassandra_to_dict_proc(conn)

conn.close()

jython_dict_display_proc (dict_aa)


print ("*** 終了 ***")
#
# ----------------------------------------------------------------
