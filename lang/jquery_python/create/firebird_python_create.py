#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	firebird_python_create.py
#
#						Jun/18/2012
# -------------------------------------------------------------------------
import	sys
import	string
import kinterbasdb
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import table_insert_proc,sql_insert_proc,create_table_proc,drop_table_proc
from text_manipulate import dict_append_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3821','松山',75200,'2003-3-10')
	dict_aa = dict_append_proc (dict_aa,'t3822','今治',98300,'2003-2-8')
	dict_aa = dict_append_proc (dict_aa,'t3823','宇和島',54800,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3824','八幡浜',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3825','新居浜',42100,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3826','西条',38700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3827','大洲',24600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3828','伊予',78400,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t3829','西予',75800,'2003-10-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
			user="sysdba", password="tiger")
cursor = conn.cursor ()
#
drop_table_proc (cursor)
create_table_proc (cursor)
conn.commit ()
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
