#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_create.pyx
#
#					Mar/10/2015
#
# --------------------------------------------------------
import	sys
import	string
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc, \
		table_insert_proc, \
		create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1071','前橋',79312,'1949-8-3')
	dict_aa = dict_append_proc (dict_aa,'t1072','高崎',46925,'1949-2-15')
	dict_aa = dict_append_proc (dict_aa,'t1073','桐生',28954,'1949-7-18')
	dict_aa = dict_append_proc (dict_aa,'t1074','沼田',81672,'1949-1-9')
	dict_aa = dict_append_proc (dict_aa,'t1075','伊勢崎',47391,'1949-5-4')
	dict_aa = dict_append_proc (dict_aa,'t1076','水上',35217,'1949-10-21')
	dict_aa = dict_append_proc (dict_aa,'t1077','太田',85243,'1949-5-23')
	dict_aa = dict_append_proc (dict_aa,'t1078','安中',21584,'1949-12-26')
	dict_aa = dict_append_proc (dict_aa,'t1079','みどり',82673,'1949-7-1')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
#
dict_aa = data_prepare_proc ()
#
conn = pymssql.connect \
	(host='host_mssql',user='sa', password='scott_tiger',database='city')
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
