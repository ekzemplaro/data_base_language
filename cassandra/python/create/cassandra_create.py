#!/usr/bin/python
# -*- coding:utf-8 -*-
#
#	cassandra_create.py
#						Sep/04/2013
#
# ---------------------------------------------------------------
import	sys
import	cql
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from cassandra_manipulate import dict_to_cassandra_proc
# ---------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0531',u'秋田'.encode ('utf-8'),39472,'2003-9-20')
	dict_aa = dict_append_proc (dict_aa,'t0532',u'男鹿'.encode ('utf-8'),47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0533',u'由利本荘'.encode ('utf-8'),27154,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0534',u'横手'.encode ('utf-8'),83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0535',u'鹿角'.encode ('utf-8'),42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0536',u'大館'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0537',u'能代'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0538',u'にかほ'.encode ('utf-8'),24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0539',u'湯沢'.encode ('utf-8'),35826,'2003-12-17')
#
	return	dict_aa
#
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#dict_display_proc (dict_aa)
#
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
print ("*** check *** bbb ***")
cursor = con.cursor()
#
dict_to_cassandra_proc (dict_aa,cursor)
#
cursor.close()
con.close()
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
