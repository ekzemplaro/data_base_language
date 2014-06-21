#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mysql_create.py
#
#					Jun/13/2011
#
# --------------------------------------------------------
import	sys
import	string
import	MySQLdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from sql_manipulate import sql_display_proc,sql_update_proc, \
		table_insert_proc,sql_insert_proc, \
		create_table_proc,drop_table_proc
from mysql_utf8 import mysql_utf8_proc
#
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',59176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',47935,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',75823,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
conn = MySQLdb.connect (host="host_mysql",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
drop_table_proc (cursor)
create_table_proc (cursor)
#
table_insert_proc (cursor,dict_aa)
#
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
