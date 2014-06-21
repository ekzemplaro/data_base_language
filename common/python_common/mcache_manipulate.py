# -*- coding: utf-8 -*-
#
#	mcache_manipulate.py
#
#					Aug/26/2013
#
# ------------------------------------------------------------
import	sys
import json
#
import datetime
import memcache
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# ------------------------------------------------------------
def	mcache_update_proc (mc,id_key,population):
	str_key = str (id_key)
	str_json = mc.get(str_key)
	array_aa = json.loads (str_json)
	array_aa['population'] = population
#
	date_mod = datetime.datetime.now ()
	array_aa['date_mod'] = '%s' % date_mod
	json_new = json.dumps (array_aa)
	mc.set (str_key,json_new)
# ------------------------------------------------------------
def	mcache_delete_proc (mc,id_key):
	str_key = str (id_key)
	mc.delete (str_key)
#
# ------------------------------------------------------------
def	mcache_display_proc (mc,key):
	str_key = str (key)
	str_json = mc.get(str_key)
	if (str_json != None):
#		print str_json
		array_aa = json.loads (str_json)
		name = array_aa['name'].encode ('utf-8')
		print key,name,array_aa['population'],array_aa['date_mod']
# ------------------------------------------------------------
def	mcache_to_dict_proc (mc,keys):
	dict_aa = {}
	for key in keys:
		str_json = mc.get(key)
		if (str_json != None):
#			print "*** aaaa ***"
#			print str_json
			array_aa = json.loads (str_json)
			name = array_aa['name'].encode ('utf-8')
			dict_append_proc (dict_aa,key,name, \
				array_aa['population'],array_aa['date_mod'])
#
	return	dict_aa
# ------------------------------------------------------------
