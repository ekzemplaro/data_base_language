#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_create.py
#
#					Mar/18/2015
#
# --------------------------------------------------------
import	sys
import	string
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import table_insert_proc, \
		create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1071','前橋',76312,'2003-2-28')
	dict_aa = dict_append_proc (dict_aa,'t1072','高崎',47925,'2003-8-10')
	dict_aa = dict_append_proc (dict_aa,'t1073','桐生',21974,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1074','沼田',83172,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1075','伊勢崎',42391,'2003-7-4')
	dict_aa = dict_append_proc (dict_aa,'t1076','水上',35287,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1077','太田',85943,'2003-5-23')
	dict_aa = dict_append_proc (dict_aa,'t1078','安中',23684,'2003-11-26')
	dict_aa = dict_append_proc (dict_aa,'t1079','みどり',81573,'2003-10-21')
#
	return	dict_aa
#
# --------------------------------------------------------
def drop_create_insert_proc (cursor,dict_aa):
	try:
		drop_table_proc (cursor)
		create_table_proc (cursor)
		table_insert_proc (cursor,dict_aa)
#
	except Exception as ee:
		sys.stderr.write ("*** error *** drop_create_insert_proc ***\n")
		sys.stderr.write (str (ee) + "\n")
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
#
dict_aa = data_prepare_proc ()
#
try:
	conn = pymssql.connect \
	(host='host_mssql',user='sa', password='scott_tiger',database='city')
#
	cursor = conn.cursor ()
#
	drop_create_insert_proc (cursor,dict_aa)
#
	conn.commit ()
#
	cursor.close ()
	conn.close ()
#
except Exception as ee:
	sys.stderr.write ("*** error *** main ***\n")
	sys.stderr.write (str (ee) + "\n")

print ("*** 終了 ***")
#
# --------------------------------------------------------
