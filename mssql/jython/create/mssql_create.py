#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mssql_create.py
#
#					Jan/17/2013
#
# --------------------------------------------------------
import	sys
from java.lang import	System
from java.lang import	String
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/jython_common')
sys.path.append ('/var/www/data_base/common/python_common')
from jython_rdb_manipulate import display_proc,drop_table_proc, \
		create_table_proc,table_insert_proc
#
from text_manipulate import dict_append_proc
#
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1071','前橋'.decode ('utf-8'),39172,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t1072','高崎'.decode ('utf-8'),17265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t1073','桐生'.decode ('utf-8'),72658,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t1074','沼田'.decode ('utf-8'),64352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1075','伊勢崎'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1076','水上'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1077','太田'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1078','安中'.decode ('utf-8'),24781,'2004-10-16')
	dict_aa = dict_append_proc (dict_aa,'t1079','みどり'.decode ('utf-8'),25823,'2004-12-18')
#
	return	dict_aa
#
#
# --------------------------------------------------------
def mssql_create_table_proc (conn):
	stmt = conn.createStatement()
	str_sql = "create table cities (id varchar(10), name nvarchar(20)," \
		+ " population int, date_mod datetime)"
	result = stmt.executeUpdate (str_sql)
	stmt.close()
#
# --------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))
#
dict_aa = data_prepare_proc ()
#
url="jdbc:sqlserver://host_mssql;databaseName=city;"
user = "sa"
password = "scott_tiger"
#
conn = DriverManager.getConnection (url,user,password)
#
drop_table_proc (conn)
mssql_create_table_proc (conn)
table_insert_proc (conn,dict_aa)
#
display_proc (conn)
#
conn.close ()
System.out.println (String ("*** 終了 ***","utf-8"))
#
# --------------------------------------------------------
