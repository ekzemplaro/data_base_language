#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/sqlite3_delete.py
#
#					Jun/01/2011
#
# --------------------------------------------------------
import	sys
import	string
#
import java
from java.sql import DriverManager
# --------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_rdb_manipulate import display_proc,delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
java.lang.Class.forName("org.sqlite.JDBC")
#
sqlite3_file = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)
#

url="jdbc:sqlite:" + sqlite3_file
user = ""
password = ""

conn = DriverManager.getConnection (url,user, password)
#
delete_proc	(conn,id_in)
#
display_proc (conn)
#
conn.close ()
#
print ("*** 終了 ***")
#
# --------------------------------------------------------
