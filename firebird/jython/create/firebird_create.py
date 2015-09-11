#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mysql_create.py
#
#					Aug/28/2015
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
from jython_rdb_manipulate import drop_table_proc, \
		create_table_proc,table_insert_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
#	dict_aa = dict_append_proc (dict_aa,'t3821','松山'.decode ('utf-8'),39174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t3821',u'松山',59174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t3822',u'今治',17235,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3823',u'宇和島',71654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t3824',u'八幡浜',64392,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3825',u'新居浜',42658,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3826',u'西条',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3827',u'大洲',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3828',u'伊予',29714,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3829',u'西予',75123,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
#
dict_aa = data_prepare_proc ()
#
java.lang.Class.forName("org.firebirdsql.jdbc.FBDriver")
#
user = "sysdba"
password = "tiger"
database = "/var/tmp/firebird/cities.fdb"

url="jdbc:firebirdsql:host_firebird:" + database
#
conn = DriverManager.getConnection (url,user, password)
#
drop_table_proc (conn)
create_table_proc (conn)
#
table_insert_proc (conn,dict_aa)
#
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
