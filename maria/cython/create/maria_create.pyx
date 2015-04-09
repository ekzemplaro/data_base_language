# -*- coding: utf-8 -*-
#
#	maria_create.pyx
#
#					Mar/10/2015
#
# --------------------------------------------------------
import	sys
import	string
import	mysql.connector
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
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山',528176,'1949-10-30')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷',482935,'1949-5-10')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山',271654,'1949-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野',816972,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡',453791,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原',321587,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社',872146,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁',215984,'1949-4-25')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見',759423,'1949-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
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
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
