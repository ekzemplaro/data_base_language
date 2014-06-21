#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	python_common/dbm_manipulate.py
#
#					Jun/27/2012
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
import	string
#
from text_manipulate import hash_update_proc
# -------------------------------------------------------------
def dbm_disp_proc	(dd):
	for id in dd.keys ():
		json_str = dd[id]
		array_bb = json.loads (json_str)
		name = array_bb['name'].encode ('utf-8')
		print id,name,array_bb['population'],array_bb['date_mod']
# -------------------------------------------------------------
def dbm_update_proc	(dd,key_in,population):
	print "dbm_update_proc *** aaaa<br />"
	print key_in,population
	print "dbm_update_proc *** bbbb<br />"
	json_str = dd[key_in]
	print "dbm_update_proc *** ffff<br />"
	array_bb = json.loads (json_str)
	print "dbm_update_proc *** kkkk<br />"
	hash_update_proc (array_bb,population)
	json_new = json.dumps (array_bb)
	dd[key_in] = json_new
# -------------------------------------------------------------
def dbm_delete_proc	(dd,id):
	key_id = str (id) 
	del dd[key_id]
#
# -------------------------------------------------------------
def dbm_to_dict_proc (dd):
#
	dict_aa = {}
	for id in dd.keys ():
		unit_aa = json.loads (dd[id])
		dict_aa[id] = unit_aa
#
	return dict_aa
# -------------------------------------------------------------
def dict_to_dbm_proc (dd,dict_aa):
	for key in sorted (dict_aa.keys()):
		unit_aa = dict_aa[key]
		json_str = json.dumps (unit_aa)
		dd[key]=json_str
#
# -------------------------------------------------------------
