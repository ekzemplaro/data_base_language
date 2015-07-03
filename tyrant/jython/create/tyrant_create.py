#!/usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/tyrant_create.py
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
	dict_aa = dict_append_proc (dict_aa,'t4761','那覇',94592,'2004-3-9')
	dict_aa = dict_append_proc (dict_aa,'t4762','宜野湾',18265,'2004-2-24')
	dict_aa = dict_append_proc (dict_aa,'t4763','石垣',72614,'2004-1-17')
	dict_aa = dict_append_proc (dict_aa,'t4764','浦添',59482,'2004-2-9')
	dict_aa = dict_append_proc (dict_aa,'t4765','名護',47351,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4766','糸満',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4767','沖縄',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4768','豊見城',23784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t4769','うるま',75823,'2004-12-15')
#
	return	dict_aa
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
host = 'host_ubuntu1'
port = 1978
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
