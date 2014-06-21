#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	tyrant_create.py
#
#					Aug/27/2013
#
# ----------------------------------------------------------------
import sys
import memcache
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_display_proc
from text_manipulate import dict_append_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t4761',u'那覇',79172,'2003-8-30')
	dict_aa = dict_append_proc (dict_aa,'t4762',u'宜野湾',47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t4763',u'石垣',21854,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t4764',u'浦添',83972,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4765',u'名護',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4766',u'糸満',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4767',u'沖縄',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4768',u'豊見城',29731,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t4769',u'うるま',15825,'2003-11-25')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
mc = memcache.Client(['127.0.0.1:1978'])
mc.flush_all()
#
dict_aa = data_prepare_proc ()
for key in dict_aa.keys():
	unit = dict_aa[key]
	str_json = json.dumps (unit)
	mc.set(key, str_json)
#
keys = {'t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769'}
#
for key in keys:
	mcache_display_proc (mc,key)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
