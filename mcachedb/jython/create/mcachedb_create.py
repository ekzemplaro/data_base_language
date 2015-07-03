#!/usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/memcachedb_create.py
#
#					Jun/01/2015
#
import sys
# reload(sys)
# sys.setdefaultencoding('utf-8')
import	json
import	socket
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_append_proc
from jython_mcache_manipulate import mcache_set_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1521','新潟',59236,'2004-2-5')
	dict_aa = dict_append_proc (dict_aa,'t1522','長岡',26541,'2004-7-18')
	dict_aa = dict_append_proc (dict_aa,'t1523','新発田',92614,'2004-1-11')
	dict_aa = dict_append_proc (dict_aa,'t1524','上越',69482,'2004-2-9')
	dict_aa = dict_append_proc (dict_aa,'t1525','糸魚川',47351,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1526','加茂',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1527','三条',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1528','佐渡',23784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1529','柏崎',75823,'2004-12-15')
	dict_aa = dict_append_proc (dict_aa,'t1530','村上',23491,'2004-8-7')
	dict_aa = dict_append_proc (dict_aa,'t1531','十日町',91765,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t1532','五泉',39287,'2004-4-25')
#
	return	dict_aa
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
host = 'host_ubuntu1'
port = 21201
addr = (host,port)
ss = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
ss.connect (addr)
#
for key in dict_aa.keys():
	unit_aa = dict_aa[key]
	json_str = json.dumps (unit_aa)
	print json_str
#
	mcache_set_proc (ss,key,json_str)
#
ss.close ()
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
