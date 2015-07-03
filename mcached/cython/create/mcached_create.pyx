# -*- coding: utf-8 -*-
#
#	create/memcached_create.pyx
#
#					Jun/02/2015
#
import sys
import json
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1731','金沢',76139,'1949-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1732','輪島',41275,'1949-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1733','小松',28654,'1949-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1734','七尾',85672,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1735','珠洲',47391,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1736','加賀',34167,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1737','羽咋',89246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1738','かほく',25784,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1739','白山',75813,'1949-12-15')
#
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
mc = memcache.Client(['127.0.0.1:11211'])
mc.flush_all()
#
for key in sorted (dict_aa.keys()):
	value = dict_aa[key]
	json_str = json.dumps (value)
	mc.set (key,json_str)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
