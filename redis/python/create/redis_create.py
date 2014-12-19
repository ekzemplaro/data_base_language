#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
#	create/redis_create.py
#
#					Dec/09/2014
#
import sys
import json
import redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1851','福井',52761,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1852','敦賀',41295,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1853','小浜',28674,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1854','大野',89612,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1855','勝山',47391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1856','鯖江',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1857','あわら',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1858','越前',25791,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1859','坂井',84139,'2003-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
dict_aa = data_prepare_proc ()
#
for key in dict_aa.keys():
	print (key)
	value = dict_aa[key]
	json_str = json.dumps (value)
	rr.set(key, json_str)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
