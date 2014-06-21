#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	neo4j_update.py
#
#					Apr/01/2013
#
# -------------------------------------------------------------------------
import	sys
import	string
import	datetime
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/python_common/lib')

from client import GraphDatabase

from text_manipulate import dict_display_proc
from text_manipulate import dict_update_proc
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
#
# -------------------------------------------------------------------------
def neo4j_read_proc (gdb):
	dict_aa = {}
	for ix in range (2,11):
		nn=gdb.node[ix]
		key= nn['id']
		dict_aa = dict_append_proc (dict_aa,key,nn['name'], \
			nn['population'],nn['date_mod'])
#
	return dict_aa
# -------------------------------------------------------------------------
print	("*** 開始 ***")
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))

gdb = GraphDatabase("http://localhost:7474/db/data/")
dict_aa = neo4j_read_proc (gdb)

dict_aa = dict_update_proc (dict_aa,id_in,population_in)

dict_display_proc (dict_aa)

neo4j_write_proc (gdb,dict_aa)
#
print	("*** 終了 ***")
#
# -------------------------------------------------------------------------
