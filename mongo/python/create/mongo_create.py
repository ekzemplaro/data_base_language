#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mongo_create.py
#
#					Jun/30/2018
#
# -------------------------------------------------------------
import	sys
import pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from mongo_manipulate import dict_to_mongo_proc
#
# -------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1161','さいたま',54916,'2003-5-20')
	dict_aa = dict_append_proc (dict_aa,'t1162','所沢',83765,'2003-8-10')
	dict_aa = dict_append_proc (dict_aa,'t1163','越谷',21654,'2003-7-14')
	dict_aa = dict_append_proc (dict_aa,'t1164','久喜',53672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1165','熊谷',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1166','秩父',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1167','川越',81946,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1168','和光',29714,'2003-10-16')
	dict_aa = dict_append_proc (dict_aa,'t1169','新座',71823,'2003-12-25')
#
	return	dict_aa
#
# -------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
dict_aa = data_prepare_proc ()
#
client = pymongo.MongoClient(username='scott',password='tiger123')
db = client['city']
#
dict_to_mongo_proc (db,dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------
