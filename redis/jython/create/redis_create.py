#!/usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/redis_create.py
#
#					Apr/12/2013
#
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
from java.lang import	System
from java.lang import	String
#
import redis.clients.jedis.Jedis
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1851','福井',74526,'2004-9-21')
	dict_aa = dict_append_proc (dict_aa,'t1852','敦賀',78253,'2004-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1853','小浜',72614,'2004-8-17')
	dict_aa = dict_append_proc (dict_aa,'t1854','大野',69482,'2004-1-9')
	dict_aa = dict_append_proc (dict_aa,'t1855','勝山',47351,'2004-12-4')
	dict_aa = dict_append_proc (dict_aa,'t1856','鯖江',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1857','あわら',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1858','越前',23784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1859','坂井',75823,'2004-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
jedis = redis.clients.jedis.Jedis("host_dbase")
#
for key in dict_aa.keys():
	unit = dict_aa[key]
	json_str = json.dumps (unit)
	jedis.set (key,json_str)
#
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
