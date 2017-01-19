#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_delete.py
#
#					Jan/19/2017
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
host_aa='localhost'
data_base = 'city'
user_aa ='scott'
password_aa = 'tiger'
conn = mysql.connector.connect(user=user_aa, password=password_aa, \
                              host=host_aa,database=data_base)
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
