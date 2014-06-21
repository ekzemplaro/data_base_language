#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_create.py
#
#					Oct/30/2013
#
# --------------------------------------------------------
import	sys
import	string
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_update_proc, \
		sql_insert_proc, \
		create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	mssql_table_insert_proc	(cursor,dict_aa):
	for key in dict_aa:
		unit = dict_aa[key]
		name = unit['name']
		name_sjis = name.encode('shift-jis') 
		sql_insert_proc	(cursor,key,name_sjis, \
			unit['population'],unit['date_mod'])
#
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1071',u'前橋',76382,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1072',u'高崎',47935,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1073',u'桐生',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1074',u'沼田',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1075',u'伊勢崎',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1076',u'水上',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1077',u'太田',85643,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1078',u'安中',21784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1079',u'みどり',82573,'2003-10-21')
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
mssql_table_insert_proc (cursor,dict_aa)
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
