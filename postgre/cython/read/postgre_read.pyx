# -*- coding: utf-8 -*-
#
#	postgre_read.pyx
#					Oct/28/2011
#
# --------------------------------------------------------
import sys
import pgdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc
#
print ("*** 開始 ***")
#
hostname="localhost"
conn = pgdb.connect (host=hostname,database="city", \
			user="scott", password="tiger")
#
cursor = conn.cursor ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
