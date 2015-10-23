# -*- coding: utf-8 -*-
#
#	create/redis_create.pyx
#
#					May/31/2012
#
import sys
import json
import redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1851','福井',53761,'1949-8-30')
	dict_aa = dict_append_proc (dict_aa,'t1852','敦賀',48295,'1949-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1853','小浜',29674,'1949-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1854','大野',84612,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1855','勝山',42391,'1949-2-4')
	dict_aa = dict_append_proc (dict_aa,'t1856','鯖江',39187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1857','あわら',83246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1858','越前',25771,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1859','坂井',84169,'1949-12-15')
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
