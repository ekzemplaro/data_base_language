#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	maria_python_create.py
#
#						Nov/14/2014
# -------------------------------------------------------------------------
import	sys
import	string
import	mysql.connector
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from sql_manipulate import table_insert_proc,sql_insert_proc,create_table_proc,drop_table_proc
#from mysql_utf8 import mysql_utf8_proc
from text_manipulate import dict_append_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',592700,'2003-2-10')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',746900,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',261400,'2003-8-24')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',183600,'2003-3-15')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',842100,'2003-5-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',938700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',724600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',378400,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',275800,'2003-10-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
conn = mysql.connector.connect (host="localhost",db="city", \
	user="scott", passwd="tiger")
cursor = conn.cursor ()
#
#mysql_utf8_proc (cursor)
drop_table_proc (cursor)
create_table_proc (cursor)
#
table_insert_proc (cursor,dict_aa)
#
conn.commit ()
cursor.close ()
conn.close ()
#
#
print ("Content-type: text/html\n\n")
#
print ("*** OK ***<p />")
# -------------------------------------------------------------------------
