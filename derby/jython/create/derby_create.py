#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mysql_create.py
#
#					Oct/01/2012
#
# --------------------------------------------------------
import	sys
import	string
from java.lang import	System
from java.lang import	String
#
import java
from java.sql import DriverManager
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
	dict_aa = dict_append_proc (dict_aa,'t3551','山口'.decode ('utf-8'),75826,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t3552','下関'.decode ('utf-8'),17365,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3553','萩'.decode ('utf-8'),72614,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t3554','徳山'.decode ('utf-8'),64328,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3555','岩国'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3556','光'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3557','宇部'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3558','長門'.decode ('utf-8'),24784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3559','防府'.decode ('utf-8'),75823,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
System.out.println (String ("*** 開始 ***","utf-8"))
#
dict_aa = data_prepare_proc ()
#
url="jdbc:derby://localhost:1527/city_aaa;create=true"

conn = DriverManager.getConnection (url)
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
