#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	cassandra_create.py
#					Sep/06/2013
#
# ----------------------------------------------------------------
#
import sys
from java.lang import	System
#
import java
from java.sql import DriverManager
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_cassandra_manipulate import dict_to_cassandra_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0531',u'秋田',74928,'2004-9-6')
	dict_aa = dict_append_proc (dict_aa,'t0532',u'男鹿',82547,'2004-2-21')
	dict_aa = dict_append_proc (dict_aa,'t0533',u'由利本荘',14529,'2004-8-18')
	dict_aa = dict_append_proc (dict_aa,'t0534',u'横手',69182,'2004-9-12')
	dict_aa = dict_append_proc (dict_aa,'t0535',u'鹿角',47951,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0536',u'大館',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0537',u'能代',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0538',u'にかほ',23784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0539',u'湯沢',75823,'2004-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
System.out.println ("*** start ***")
print ("*** 開始 ***")
#
str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

dict_aa = data_prepare_proc ()
dict_to_cassandra_proc (dict_aa,conn)

conn.close()

print ("*** 終了 ***")
#
# ----------------------------------------------------------------
