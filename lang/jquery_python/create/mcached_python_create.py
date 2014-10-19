#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	mcached_python_create.py
#
#						Oct/15/2014
# -------------------------------------------------------------------------
import sys
import memcache
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1731',u'金沢',61400,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1732',u'輪島',72800,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1733',u'小松',21600,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1734',u'七尾',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1735',u'珠洲',42300,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1736',u'加賀',53800,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1737',u'羽咋',81600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1738',u'かほく',25700,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1739',u'白山',58200,'2003-12-15')
#
#
	return	dict_aa
#
# -------------------------------------------------------------------------
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
#
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
