#!/usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/memcached_create.py
#
#					Apr/15/2013
#
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
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
	dict_aa = dict_append_proc (dict_aa,'t1731',u'金沢',14592,'2004-9-4')
#	dict_aa = dict_append_proc (dict_aa,'t1731','金沢'.encode ('utf-8'),14592,'2004-9-4')
#	dict_aa = dict_append_proc (dict_aa,'t1731','金沢'.decode ('utf-8'),14592,'2004-9-4')
#	dict_aa = dict_append_proc (dict_aa,'t1731','金沢',14592,'2004-9-4')
#	dict_aa = dict_append_proc (dict_aa,'t1732','輪島',78265,'2004-8-12')
#	dict_aa = dict_append_proc (dict_aa,'t1733','小松',92614,'2004-1-17')
#	dict_aa = dict_append_proc (dict_aa,'t1734','七尾',69482,'2004-2-9')
#	dict_aa = dict_append_proc (dict_aa,'t1735','珠洲',47351,'2004-8-4')
#	dict_aa = dict_append_proc (dict_aa,'t1736','加賀',35187,'2004-1-21')
#	dict_aa = dict_append_proc (dict_aa,'t1737','羽咋',81256,'2004-7-23')
#	dict_aa = dict_append_proc (dict_aa,'t1738','かほく',23784,'2004-10-26')
#	dict_aa = dict_append_proc (dict_aa,'t1739','白山',75823,'2004-12-15')
#
	return	dict_aa
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
host = 'localhost'
port = 11211
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
