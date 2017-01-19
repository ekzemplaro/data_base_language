# -*- coding: utf-8 -*-
#
#	voldemort_manipulate.py
#
#					Jan/27/2012
import voldemort
import json
import sys
#
# ------------------------------------------------------------
def voldemort_to_dict_proc (client):
	keys = {"t3051","t3052","t3053",
		"t3054","t3055","t3056",
		"t3057","t3058","t3059"}

	dict_aa = {}
	for key in keys:
		resp = client.get (key)
		if (0 < len (resp)):
			json_str = resp[0][0]
			unit_aa =  json.loads (json_str)
			dict_aa[key] = unit_aa
#			name = unit_aa['name'].encode ('utf-8')
#			print key,name,unit_aa['population'],unit_aa['date_mod']
	return	dict_aa
# ------------------------------------------------------------
