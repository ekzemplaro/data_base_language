#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mysql_create.py
#
#					Jun/01/2011
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
	dict_aa = dict_append_proc (dict_aa,'t3821','松山'.decode ('utf-8'),39174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t3822','今治'.decode ('utf-8'),17265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3823','宇和島'.decode ('utf-8'),72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t3824','八幡浜'.decode ('utf-8'),64352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3825','新居浜'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3826','西条'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3827','大洲'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3828','伊予'.decode ('utf-8'),24784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3829','西予'.decode ('utf-8'),75823,'2004-12-15')
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
java.lang.Class.forName("org.firebirdsql.jdbc.FBDriver")
#
database = "/var/tmp/firebird/cities.fdb"
url="jdbc:firebirdsql:localhost/3050:" + database
user = "sysdba"
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
