#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	sqlite3_create.py
#
#						Jun/02/2011
#
# -------------------------------------------------------------------------
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
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0711','郡山'.decode ('utf-8'),39174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t0712','会津若松'.decode ('utf-8'),17265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t0713','白河'.decode ('utf-8'),72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t0714','福島'.decode ('utf-8'),64352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0715','喜多方'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0716','二本松'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0717','いわき'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0718','相馬'.decode ('utf-8'),24784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0719','須賀川'.decode ('utf-8'),75823,'2004-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
def	sqlite3_write_proc (sqlite3_file,dict_aa):
	java.lang.Class.forName("org.sqlite.JDBC")
#
	url="jdbc:sqlite:" + sqlite3_file
	user = ""
	password = ""

	conn = DriverManager.getConnection (url,user, password)

	stmt = conn.createStatement ()
#
	drop_table_proc (conn)
	create_table_proc (conn)
#
	table_insert_proc (conn,dict_aa)
#
	display_proc (conn)
#
	conn.close ()
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
System.out.println (String ("*** 開始 ***","utf-8"))
#
file_out = sys.argv[1]
#
print	file_out
#
dict_aa = data_prepare_proc ()
#
sqlite3_write_proc (file_out,dict_aa)
#
print	("*** 終了 ***")
System.out.println (String ("*** 終了 ***","utf-8"))
# -------------------------------------------------------------------------
