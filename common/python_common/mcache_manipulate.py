# -*- coding: utf-8 -*-
#
#	mcache_manipulate.py
#
#					Oct/07/2014
#
# ------------------------------------------------------------
import	sys
import json
#
import datetime
# import memcache
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# ------------------------------------------------------------
def	mcache_update_proc (mc,id_key,population):
	print ("*** mcache_update_proc ***")
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
def	mcache_to_dict_proc (mc,keys):
	dict_aa = {}
	for key in keys:
		str_json = str (mc.get(key))
		if (str_json != "None"):
#
			try:
				array_aa = json.loads (str_json)
				name = array_aa['name']
				dict_append_proc (dict_aa,key,name, \
				array_aa['population'],array_aa['date_mod'])
			except Exception as ee:
				sys.stderr.write ("*** error *** mcache_to_dict_proc ***\n")
				sys.stderr.write (str (ee) + "\n")
				sys.stderr.write (str_json + "\n")
#
	return	dict_aa
#
# ------------------------------------------------------------
