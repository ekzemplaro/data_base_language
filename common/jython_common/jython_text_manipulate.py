# -*- coding: utf-8 -*-
#
#	jython_text_manipulate.py
#
#					Sep/25/2011
import	sys
import	string
#
# ---------------------------------------------------------------
def	jython_dict_display_proc (dict_aa):
	for key in dict_aa.keys():
		if ((key != "_id") and (key != "_rev")):
			unit = dict_aa[key]
			print	key,"\t",unit['name'],"\t",
			print	unit['population'],"\t",unit['date_mod']
# ---------------------------------------------------------------
