# -*- coding: utf-8 -*-
#
#	mongo_create.pyx
#
#					Sep/14/2015
#
# -------------------------------------------------------------
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from mongo_manipulate import dict_to_mongo_proc
#
import pymongo
# -------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1161','さいたま',58176,'1949-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1162','所沢',47935,'1949-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1163','越谷',21659,'1949-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1164','久喜',83472,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1165','熊谷',42391,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1166','秩父',35187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1167','川越',81246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1168','和光',23784,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1169','新座',75823,'1949-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
dict_to_mongo_proc (dict_aa)
#
print ("*** 終了 ***")
# -------------------------------------------------------------
