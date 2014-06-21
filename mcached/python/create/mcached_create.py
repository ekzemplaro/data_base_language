#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	create/memcached_create.py
#
#					Aug/30/2013
#
# ----------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import memcache
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_display_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1731',u'金沢'.encode ('utf-8'),76138,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1732',u'輪島'.encode ('utf-8'),47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1733',u'小松',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1734',u'七尾',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1735',u'珠洲',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1736',u'加賀'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1737',u'羽咋'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1738',u'かほく'.encode ('utf-8'),25781,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1739',u'白山'.encode ('utf-8'),75823,'2003-12-15')
#
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
mc = memcache.Client(['127.0.0.1:11211'])
mc.flush_all()
#
for key in sorted (dict_aa.keys()):
	value = dict_aa[key]
	json_str = json.dumps (value)
	mc.set (key,json_str)
#
keys = {'t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739'}
#
for key in keys:
	mcache_display_proc (mc,key)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
