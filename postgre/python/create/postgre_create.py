#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	postgre_create.py
#
#					Jun/13/2011
#
# --------------------------------------------------------
import	sys
import	pgdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_update_proc, \
		table_insert_proc,sql_insert_proc, \
		create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3461','広島',28176,'2003-2-20')
	dict_aa = dict_append_proc (dict_aa,'t3462','福山',46935,'2003-8-12')
	dict_aa = dict_append_proc (dict_aa,'t3463','東広島',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3464','呉',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3465','尾道',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3466','竹原',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3467','三次',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3468','大竹',24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3469','府中',75823,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
#
dict_aa = data_prepare_proc ()
#
hostname="localhost"
conn = pgdb.connect (host=hostname,database="city", \
			user="scott", password="tiger")
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
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
