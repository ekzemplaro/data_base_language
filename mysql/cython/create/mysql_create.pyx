# -*- coding: utf-8 -*-
#
#	mysql_create.pyx
#
#					Mar/29/2013
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
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',59176,'1950-4-30')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',47935,'1950-5-10')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',21654,'1950-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',83672,'1950-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',42391,'1950-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',35187,'1950-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',81246,'1950-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',23784,'1950-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',75823,'1950-12-15')
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
