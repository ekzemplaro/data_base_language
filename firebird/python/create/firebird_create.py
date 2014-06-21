#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_create.py
#
#					Oct/28/2013
#
# --------------------------------------------------------
import	sys
import	string
import kinterbasdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from sql_manipulate import sql_display_proc,sql_update_proc, \
		table_insert_proc,sql_insert_proc, \
		create_table_proc,drop_table_proc
#
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3821','松山',59761,'2003-8-30')
	dict_aa = dict_append_proc (dict_aa,'t3822','今治',47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t3823','宇和島',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3824','八幡浜',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3825','新居浜',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3826','西条',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3827','大洲',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3828','伊予',25784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3829','西予',83156,'2003-6-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
			user="sysdba", password="tiger")
#
cursor = conn.cursor ()
#
drop_table_proc (cursor)
create_table_proc (cursor)
#
conn.commit ()
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
