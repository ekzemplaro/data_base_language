#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_create.py
#
#					Oct/14/2016
#
# --------------------------------------------------------
import	sys
import	string
import	mysql.connector
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from sql_manipulate import sql_update_proc, \
		table_insert_proc,sql_insert_proc, \
		create_table_proc,drop_table_proc
#
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',529176,'2003-9-20')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',791835,'2003-2-15')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',163754,'2003-8-18')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',369172,'2003-1-9')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',237451,'2003-3-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',518397,'2003-5-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',248156,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',478294,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',863751,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
dict_aa = data_prepare_proc ()
#
conn = mysql.connector.connect (host="localhost",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
drop_table_proc (cursor)
create_table_proc (cursor)
#
table_insert_proc (cursor,dict_aa)
#
conn.commit ()
#
cursor.close ()
conn.close ()
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
