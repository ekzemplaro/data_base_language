#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	maria_create.py
#
#					May/23/2014
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
		create_table_proc,table_insert_proc, \
		mysql_utf8_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3321','岡山'.decode ('utf-8'),359174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t3322','倉敷'.decode ('utf-8'),178265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3323','津山'.decode ('utf-8'),729654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t3324','玉野'.decode ('utf-8'),641352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3325','笠岡'.decode ('utf-8'),427651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3326','井原'.decode ('utf-8'),359187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3327','総社'.decode ('utf-8'),814256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3328','高梁'.decode ('utf-8'),218784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3329','新見'.decode ('utf-8'),759823,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
System.out.println (String ("*** 開始 ***","utf-8"))
#
#
dict_aa = data_prepare_proc ()
#
url="jdbc:mysql://localhost/city"
user = "scott"
password = "tiger"
#
conn = DriverManager.getConnection (url,user, password)
#
mysql_utf8_proc (conn)
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
