#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	redis_python_create.py
#
#						Dec/09/2014
# -------------------------------------------------------------------------
import sys
import json
import redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1851','福井',52700,'2003-9-22')
	dict_aa = dict_append_proc (dict_aa,'t1852','敦賀',41500,'2003-2-15')
	dict_aa = dict_append_proc (dict_aa,'t1853','小浜',28400,'2003-7-8')
	dict_aa = dict_append_proc (dict_aa,'t1854','大野',89600,'2003-1-19')
	dict_aa = dict_append_proc (dict_aa,'t1855','勝山',49100,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t1856','鯖江',35700,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t1857','あわら',84600,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t1858','越前',25700,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1859','坂井',84300,'2003-12-15')
#
	return	dict_aa
# -------------------------------------------------------------------------
#

rr = redis.Redis(host='host_dbase', port=6379, db=0)

dict_aa = data_prepare_proc ()
#
for key in dict_aa.keys():
	value = dict_aa[key]
	json_str = json.dumps (value)
	rr.set(key, json_str)
#
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
