#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	maria_delete.py
#
#					May/23/2014
#
# --------------------------------------------------------
import	sys
import	string
from java.lang import	System
#
import java
from java.sql import DriverManager
#
#
sys.path.append ('/var/www/data_base/common/jython_common')
#
from jython_rdb_manipulate import display_proc,delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#

url="jdbc:mysql://localhost/city"
user = "scott"
password = "tiger"

conn = DriverManager.getConnection (url,user, password)
#
#
delete_proc	(conn,id_in)
#
display_proc (conn)
#
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
