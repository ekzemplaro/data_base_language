#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mysql_delete.py
#
#					Jun/01/2011
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

url="jdbc:mysql://host_mysql/city"
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
