#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	master_python_read.py
#
#					Jul/31/2014
import	sys
import	json
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# ---------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0421','仙台',41295,'2003-8-12')
	dict_aa = dict_append_proc (dict_aa,'t0422','石巻',27936,'2003-5-21')
	dict_aa = dict_append_proc (dict_aa,'t0423','塩竈',19825,'2003-4-9')
	dict_aa = dict_append_proc (dict_aa,'t0424','気仙沼',39256,'2003-2-25')
	dict_aa = dict_append_proc (dict_aa,'t0425','白石',81452,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t0426','名取',62397,'2003-7-26')
	dict_aa = dict_append_proc (dict_aa,'t0427','多賀城',52984,'2003-10-8')
	dict_aa = dict_append_proc (dict_aa,'t0428','岩沼',93612,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0429','大崎',89431,'2003-8-18')
#
	return	dict_aa
#
# ---------------------------------------------------------------------
dict_aa = data_prepare_proc ()
json_str = json.dumps (dict_aa)
#
print ("Content-type: text/json; charset=UTF-8\n\n")
#
print (json_str)
#
# ---------------------------------------------------------------------
