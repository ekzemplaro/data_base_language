#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	drizzle_update.py
#
#					Jul/16/2014
#
# --------------------------------------------------------
import	sys
import	string
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/jython_common')
#
from jython_rdb_manipulate import display_proc,update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#

url="jdbc:drizzle://localhost:4427/city"
user = "scott"
password = "tiger"

conn = DriverManager.getConnection (url,user, password)
#
update_proc	(conn,id_in,population_in)
#
display_proc (conn)
#
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
