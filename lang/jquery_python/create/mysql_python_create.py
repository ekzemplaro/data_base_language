#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	mysql_python_create.py
#
#						Jul/02/2011
# -------------------------------------------------------------------------
import	sys
import	string
import	MySQLdb
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from sql_manipulate import table_insert_proc,sql_insert_proc,create_table_proc,drop_table_proc
from mysql_utf8 import mysql_utf8_proc
from text_manipulate import dict_append_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',91700,'2003-9-30')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',47900,'2003-8-10')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',65400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',42100,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',38700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',24600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',78400,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',75800,'2003-10-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
conn = MySQLdb.connect (host="host_mysql",db="city", \
	user="scott", passwd="tiger")
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
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
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
