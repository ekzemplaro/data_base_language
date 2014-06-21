#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	voldemort_read.py
#
#					Jan/27/2012
import voldemort
import json
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from voldemort_manipulate import voldemort_to_dict_proc
# ------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3051',u'和歌山'.encode ('utf-8'),59624,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t3052',u'海南'.encode ('utf-8'),47237,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t3053',u'橋本'.encode ('utf-8'),21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3054',u'有田'.encode ('utf-8'),83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3055',u'御坊'.encode ('utf-8'),42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3056',u'田辺'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3057',u'新宮'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3058',u'紀の川'.encode ('utf-8'),24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3059',u'岩出'.encode ('utf-8'),75823,'2003-12-15')
#
	return	dict_aa
#
# ------------------------------------------------------------
print	("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
client = voldemort.StoreClient('cities', [('localhost', 6666)])
#
for key in dict_aa.keys():
	unit_aa = dict_aa[key]
	json_str = json.dumps (unit_aa)
	client.put (key,json_str)
#
dict_aa = voldemort_to_dict_proc (client)
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
# ------------------------------------------------------------
