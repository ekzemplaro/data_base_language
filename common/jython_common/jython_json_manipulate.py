#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	jython_common/jython_json_manipulate.py
#
#				Jun/20/2012
#
# -------------------------------------------------------------------
import	sys
import	datetime
from java.lang import	System
from java.lang import	String
#
from org.json.simple import JSONValue
# -------------------------------------------------------------------
def	dict_to_json_proc (dict_aa):
#	set_aaa = dict_aa.keySet ()
	str_json = "{"
#
	icount = 0
	llx = len (dict_aa)
#	for key in set_aaa:
	for key in dict_aa.keys ():
		unit_aa = dict_aa[key]
		str_json += "\"%s\": {" % key
		str_json += "\"name\": \"" + unit_aa['name']
		str_json += "\",\"population\": %d," % unit_aa['population']
		str_json += "\"date_mod\": \"" + unit_aa['date_mod']
		str_json += "\"}"
		if (icount < (llx - 1)):
			str_json += ","
		icount += 1
#
	str_json += "}"
#
	return	str_json
#
# -------------------------------------------------------------------
def	json_to_dict_proc (str_json):
	dict_aa = {}
	obj_aa = JSONValue.parse (str_json)
#
	set_aaa = obj_aa.keySet ()
#
	for key in set_aaa:
#		print key + "\t",
		unit_aa = obj_aa.get (key)
		dict_aa[key] = unit_aa
#
	return	dict_aa
# -------------------------------------------------------------------
