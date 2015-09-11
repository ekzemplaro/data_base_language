#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	oracle_delete.py
#
#				Aug/05/2015
#
# --------------------------------------------------------
import sys
import string
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/jython_common')
#
from jython_rdb_manipulate import display_proc,delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe"
#
conn = DriverManager.getConnection (str_connect,user,password)
#
delete_proc	(conn,id_in)
#
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
