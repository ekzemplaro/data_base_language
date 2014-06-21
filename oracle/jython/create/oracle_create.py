#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	oracle_create.py
#
#					Jun/01/2011
#
# --------------------------------------------------------
import	sys
from java.lang import	System
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
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0131','函館'.decode ('utf-8'),39174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t0132','札幌'.decode ('utf-8'),17265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t0133','帯広'.decode ('utf-8'),72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t0134','釧路'.decode ('utf-8'),64352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0135','旭川'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0136','北見'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0137','室蘭'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0138','根室'.decode ('utf-8'),24784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0139','稚内'.decode ('utf-8'),75823,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
System.out.println (u"*** 開始 ***")
#
java.lang.Class.forName("oracle.jdbc.driver.OracleDriver")
#
dict_aa = data_prepare_proc ()
#
url="jdbc:oracl:thin:@spn109:1521/xe"
user = "scott"
password = "tiger"
#
conn = DriverManager.getConnection (url,user,password)
#
drop_table_proc (conn)
create_table_proc (conn)
table_insert_proc (conn,dict_aa)
#
display_proc (conn)
#
conn.close ()
System.out.println ("*** 終了 ***")
#
# --------------------------------------------------------
