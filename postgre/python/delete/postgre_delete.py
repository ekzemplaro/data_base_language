#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/postgre_delete.py
#
#				Sep/06/2016
#
# --------------------------------------------------------
import sys
import psycopg2
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_proc
#
# --------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
key_in = sys.argv[1]
print ("%s" % key_in)
#
conn = psycopg2.connect("dbname=city user=scott password=tiger")
cur = conn.cursor()
#
sql_delete_proc	(cur,key_in)
#
conn.commit ()
#
cur.close ()
conn.close ()
#
#
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
