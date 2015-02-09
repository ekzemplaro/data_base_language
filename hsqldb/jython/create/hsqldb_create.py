#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	hsqldb_create.py
#
#					Jan/29/2015
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
	dict_aa = dict_append_proc (dict_aa,'t4671','鹿児島'.decode ('utf-8'),39174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t4672','指宿'.decode ('utf-8'),17365,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t4673','志布志'.decode ('utf-8'),72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t4674','川内'.decode ('utf-8'),64352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4675','鹿屋'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4676','枕崎'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4677','出水'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4678','阿久根'.decode ('utf-8'),29781,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t4679','霧島'.decode ('utf-8'),75823,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
System.out.println (String ("*** 開始 ***","utf-8"))
#
java.lang.Class.forName("org.hsqldb.jdbcDriver")
#
dict_aa = data_prepare_proc ()
#
database = "file:/var/tmp/hsqldb/cities;shutdown=true"
url="jdbc:hsqldb:" + database
user = "SA"
password = ""

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
