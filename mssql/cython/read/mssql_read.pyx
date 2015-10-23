# -*- coding: utf-8 -*-
#
#	mssql_read.pyx
#
#						Mar/12/2015
#
#
# ----------------------------------------------------------------
import	sys
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
# ----------------------------------------------------------------
#
from sql_manipulate import sql_to_dict_proc
from text_manipulate import dict_display_proc
#
print ("*** 開始 ***")
#
server = 'host_mssql'
user='sa'
password='scott_tiger'
database='city'
#
conn = pymssql.connect \
	(host=server,user=user,password=password,database=database)
cursor = conn.cursor(as_dict=True)
#
dict_aa=sql_to_dict_proc (cursor)
#
cursor.close ()
conn.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
