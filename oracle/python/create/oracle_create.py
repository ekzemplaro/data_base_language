#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_create.py
#
#					Jun/13/2011
#
# --------------------------------------------------------
import	sys
import	cx_Oracle
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,table_insert_proc,sql_insert_proc, \
		create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0131','函館',59176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t0132','札幌',47935,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0133','帯広',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0134','釧路',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0135','旭川',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0136','北見',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0137','室蘭',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0138','根室',24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0139','稚内',75823,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
#conn = cx_Oracle.connect ("system/hello9@spn109:1521/orcl")
conn = cx_Oracle.connect (u"scott/tiger@spn109:1521/xe")
#
cursor = conn.cursor ()
#
#
drop_table_proc (cursor)
create_table_proc (cursor)
#
table_insert_proc (cursor,dict_aa)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
