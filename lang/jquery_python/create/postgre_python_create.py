#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	postgre_python_create.py
#
#						Jun/24/2015
# -------------------------------------------------------------------------
import	sys
import	pgdb
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from sql_manipulate import table_insert_proc,sql_insert_proc,create_table_proc,drop_table_proc
from text_manipulate import dict_append_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3461','広島',17600,'2003-5-20')
	dict_aa = dict_append_proc (dict_aa,'t3462','福山',93500,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t3463','東広島',21600,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3464','呉',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3465','尾道',39100,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3466','竹原',51800,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3467','三次',81200,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3468','大竹',78400,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3469','府中',23400,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
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
cursor.close ()
conn.close ()
#
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
