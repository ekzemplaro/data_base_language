#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	maria_update.py
#
#					May/23/2014
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

url="jdbc:mysql://localhost/city"
user = "scott"
password = "tiger"

conn = DriverManager.getConnection (url,user, password)

#
#
#mysql_utf8_proc (cursor)
#
update_proc	(conn,id_in,population_in)
#
display_proc (conn)
#
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
