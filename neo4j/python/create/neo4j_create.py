#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	neo4j_create.py
#
#					Apr/01/2013
#
# -------------------------------------------------------------------------
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
#sys.path.append ('/var/www/data_base/common/python_common/lib')

from neo4jrestclient.client import GraphDatabase

from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
# -------------------------------------------------------------------------
def	neo4j_write_proc (gdb,dict_aa):
	ix = 1
	for key in dict_aa.keys():
		unit = dict_aa[key]
		nn=gdb.node[ix]
		nn['id'] = key
		nn['name'] = unit['name']
		nn['population'] = unit['population']
		nn['date_mod'] = unit['date_mod']
		ix += 1

# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t4051',u'福岡'.encode ('utf-8'),39176,'2003-8-30')
	dict_aa = dict_append_proc (dict_aa,'t4052',u'北九州'.encode ('utf-8'),17285,'2003-2-10')
	dict_aa = dict_append_proc (dict_aa,'t4053',u'大牟田'.encode ('utf-8'),72654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t4054',u'久留米'.encode ('utf-8'),82351,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4055',u'直方'.encode ('utf-8'),69348,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4056',u'飯塚'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4057',u'田川'.encode ('utf-8'),81256,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4058',u'柳川'.encode ('utf-8'),23784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t4059',u'八女'.encode ('utf-8'),75823,'2003-12-16')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")

dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)

gdb = GraphDatabase("http://localhost:7474/db/data/")

neo4j_write_proc (gdb,dict_aa)
#
print	("*** 終了 ***")
#
# -------------------------------------------------------------------------
