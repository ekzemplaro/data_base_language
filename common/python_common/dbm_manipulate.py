# -*- coding: utf-8 -*-
#
#	python_common/dbm_manipulate.py
#
#					Jul/30/2014
import	sys
import	json
import	string
#
from text_manipulate import hash_update_proc
# -------------------------------------------------------------
def dbm_disp_proc	(dd):
	for key in dd.keys ():
#		json_str = str (dd[key])
		json_str = dd[key].decode('utf-8')
#		print (json_str)
		unit_aa = json.loads (json_str)
		name = unit_aa['name']
		print (key.decode('utf-8'),name,unit_aa['population'],unit_aa['date_mod'])
# -------------------------------------------------------------
def dbm_update_proc	(dd,key_in,population):
	print ("dbm_update_proc *** aaaa ***")
	json_str = dd[bytes(key_in,'utf-8')]
	array_bb = json.loads (json_str.decode('utf-8'))
	hash_update_proc (array_bb,population)
	json_new = json.dumps (array_bb)
	dd[bytes(key_in,'utf-8')] = json_new
# -------------------------------------------------------------
def dbm_delete_proc	(dd,key):
	if bytes(key,'utf-8') in dd.keys ():
		del dd[bytes(key,'utf-8')]
#
# -------------------------------------------------------------
def dbm_to_dict_proc (dd):
#
	dict_aa = {}
	for id in dd.keys ():
		key = id.decode("utf-8")
#		print (str (dd[id]))
		unit_aa = json.loads (dd[id].decode("utf-8"))
		dict_aa[key] = unit_aa
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
