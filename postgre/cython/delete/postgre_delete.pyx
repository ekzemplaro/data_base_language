# -*- coding: utf-8 -*-
#
#	delete/postgre_delete.pyx
#
#				Oct/28/2011
#
# --------------------------------------------------------
import sys
import pgdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
hostname="localhost"
conn = pgdb.connect (host=hostname,database="city", \
			user="scott", password="tiger")
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,id_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
