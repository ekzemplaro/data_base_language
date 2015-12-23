#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	mssql_python_create.py
#
#						Nov/19/2015
# -------------------------------------------------------------------------
import	sys
import	pymssql
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import table_insert_proc,create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1071','前橋',78200,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t1072','高崎',49500,'2003-2-15')
	dict_aa = dict_append_proc (dict_aa,'t1073','桐生',91400,'2003-5-18')
	dict_aa = dict_append_proc (dict_aa,'t1074','沼田',87200,'2003-1-2')
	dict_aa = dict_append_proc (dict_aa,'t1075','伊勢崎',43100,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1076','水上',35200,'2003-10-21')
	dict_aa = dict_append_proc (dict_aa,'t1077','太田',87300,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1078','安中',25100,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t1079','みどり',69300,'2003-4-21')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
server_mssql = 'host_mssql\EG'
user_mssql = 'sa'
password_mssql = 'Tiger123'
#
conn = pymssql.connect \
	(host=server_mssql,user=user_mssql,password=password_mssql,database='city')
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
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
