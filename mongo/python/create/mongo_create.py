#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_create.py
#
#						Sep/02/2013
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
	dict_aa = dict_append_proc (dict_aa,'t1161',u'さいたま'.encode ('utf-8'),59176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1162',u'所沢'.encode ('utf-8'),47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1163',u'越谷'.encode ('utf-8'),21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1164',u'久喜'.encode ('utf-8'),83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1165',u'熊谷'.encode ('utf-8'),42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1166',u'秩父'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1167',u'川越'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1168',u'和光'.encode ('utf-8'),29784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1169',u'新座'.encode ('utf-8'),75823,'2003-12-15')
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
