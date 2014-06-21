#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	postgre_create.py
#
#					Jun/01/2011
#
# --------------------------------------------------------
import	sys
import	string
#
import	java
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
	dict_aa = dict_append_proc (dict_aa,'t3461','広島'.decode ('utf-8'),39574,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t3462','福山'.decode ('utf-8'),49265,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3463','東広島'.decode ('utf-8'),72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t3464','呉'.decode ('utf-8'),64352,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3465','尾道'.decode ('utf-8'),42651,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3466','竹原'.decode ('utf-8'),35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3467','三次'.decode ('utf-8'),81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3468','大竹'.decode ('utf-8'),24784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3469','府中'.decode ('utf-8'),75823,'2004-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
url="jdbc:postgresql://localhost/city"
user = "scott"
password = "tiger"

conn = DriverManager.getConnection (url,user, password)

#
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
#
# --------------------------------------------------------
