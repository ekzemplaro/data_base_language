#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	read/sqlite3_read.py
#					Sep/06/2016
#
# ------------------------------------------------------------------
import	sys
import	sqlite3
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_to_dict_proc
from text_manipulate import dict_display_proc
#
# ------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
file_in=sys.argv[1]
conn = sqlite3.connect (file_in)
# conn.text_factory=str
conn.row_factory = sqlite3.Row
#
cursor = conn.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
#
cursor.close ()
conn.close ()
#
dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# ------------------------------------------------------------------
