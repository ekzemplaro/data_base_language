#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	drizzle_create.py
#
#					Jul/16/2014
#
# --------------------------------------------------------
import	sys
import	string
import java
from java.sql import DriverManager
from java.lang import	System
from java.lang import	String
#
sys.path.append ('/var/www/data_base/common/jython_common')
sys.path.append ('/var/www/data_base/common/python_common')
#
from jython_rdb_manipulate import display_proc,drop_table_proc, \
		create_table_proc,table_insert_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2651','京都'.decode ('utf-8'),49374,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t2652','福知山'.decode ('utf-8'),18265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t2653','舞鶴'.decode ('utf-8'),72154,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t2654','綾部'.decode ('utf-8'),64892,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2655','宇治'.decode ('utf-8'),42971,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2656','宮津'.decode ('utf-8'),35847,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2657','亀岡'.decode ('utf-8'),81356,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2658','城陽'.decode ('utf-8'),29784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2659','向日'.decode ('utf-8'),75123,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
System.out.println (String ("*** 開始 ***","utf-8"))
#
dict_aa = data_prepare_proc ()
#
url="jdbc:drizzle://localhost:4427/city"
user = "scott"
password = "tiger"
#
conn = DriverManager.getConnection (url,user, password)
#
drop_table_proc (conn)
create_table_proc (conn)
#
table_insert_proc (conn,dict_aa)
#
#conn.commit ()
#
display_proc (conn)
#
conn.close ()
print ("*** 終了 ***")
System.out.println (String ("*** 終了 ***","utf-8"))
#
# --------------------------------------------------------
