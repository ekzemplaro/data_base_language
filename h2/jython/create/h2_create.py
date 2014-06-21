#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	h2_create.py
#
#					Nov/22/2013
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
	dict_aa = dict_append_proc (dict_aa,'t4561','宮崎'.decode ('utf-8'),32174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t4562','日南'.decode ('utf-8'),17265,'2004-10-12')
	dict_aa = dict_append_proc (dict_aa,'t4563','延岡'.decode ('utf-8'),72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t4564','都城'.decode ('utf-8'),64352,'2004-12-9')
	dict_aa = dict_append_proc (dict_aa,'t4565','小林'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4566','日向'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4567','串間'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4568','西都'.decode ('utf-8'),25784,'2004-5-26')
	dict_aa = dict_append_proc (dict_aa,'t4569','えびの'.decode ('utf-8'),75823,'2004-11-18')
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
database = "file:/var/tmp/h2/cities"
url="jdbc:h2:" + database
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
