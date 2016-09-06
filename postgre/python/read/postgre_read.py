#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_read.py
#					Sep/06/2016
#
# --------------------------------------------------------
import sys
import psycopg2
import psycopg2.extras

sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_to_dict_proc
from text_manipulate import dict_display_proc
#
sys.stderr.write ("*** 開始 ***\n")
#
conn = psycopg2.connect("dbname=city user=scott password=tiger")
cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
#
dict_aa = sql_to_dict_proc (cur)
#
cur.close()
conn.close()

dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
