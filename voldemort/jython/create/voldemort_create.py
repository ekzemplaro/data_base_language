#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	voldemort_create.py
#
#					Sep/10/2013
#
# ----------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
import java
from voldemort.client import SocketStoreClientFactory
from voldemort.client import ClientConfig
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3051','和歌山',91624,'2004-10-21')
	dict_aa = dict_append_proc (dict_aa,'t3052','海南',17825,'2004-8-12')
	dict_aa = dict_append_proc (dict_aa,'t3053','橋本',61439,'2004-2-17')
	dict_aa = dict_append_proc (dict_aa,'t3054','有田',69482,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3055','御坊',47351,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3056','田辺',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3057','新宮',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3058','紀の川',23784,'2004-11-26')
	dict_aa = dict_append_proc (dict_aa,'t3059','岩出',75823,'2004-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
def dict_to_voldemort_proc (dict_aa,client):
	print ("*** dict_to_voldemort_proc *** start ***")
#
#
	for key in dict_aa.keys():
#		print (key)
		value = dict_aa[key]
		json_str=json.dumps (value)
		client.put(key, json_str)
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
factory = SocketStoreClientFactory (ClientConfig().setBootstrapUrls("tcp://localhost:6666"))
#
client = factory.getStoreClient ("cities")
dict_to_voldemort_proc (dict_aa,client)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
