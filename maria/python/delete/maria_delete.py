#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_delete.py
#
#					Oct/14/2016
#
# --------------------------------------------------------
import	sys
import	mysql.connector
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_proc
#
# --------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
conn = mysql.connector.connect (host="localhost",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,key_in)
conn.commit ()
#
cursor.close ()
conn.close ()
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
