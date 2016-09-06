#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_create.py
#
#					Sep/06/2016
#
# --------------------------------------------------------
import	sys
import	psycopg2
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from sql_manipulate import table_insert_proc,create_table_proc,drop_table_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3461','広島',25176,'2003-9-24')
	dict_aa = dict_append_proc (dict_aa,'t3462','福山',47935,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t3463','東広島',28654,'2003-2-8')
	dict_aa = dict_append_proc (dict_aa,'t3464','呉',83152,'2003-10-9')
	dict_aa = dict_append_proc (dict_aa,'t3465','尾道',42791,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3466','竹原',35687,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3467','三次',81296,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3468','大竹',21764,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3469','府中',75423,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
#
dict_aa = data_prepare_proc ()
#
conn = psycopg2.connect("dbname=city user=scott password=tiger")
cur = conn.cursor()
drop_table_proc (cur)
create_table_proc (cur)
table_insert_proc (cur,dict_aa)
#
conn.commit ()
#
#
cur.close ()
conn.close ()
#
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
