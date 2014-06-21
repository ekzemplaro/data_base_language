#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	csv_create.py
#
#					Jul/02/2011
#
# -------------------------------------------------------------------------
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1271',u'千葉'.encode ('utf-8'),59178,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t1272',u'勝浦'.encode ('utf-8'),47285,'2003-10-15')
	dict_aa = dict_append_proc (dict_aa,'t1273',u'市原'.encode ('utf-8'),62654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1274',u'流山'.encode ('utf-8'),64251,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1275',u'八千代'.encode ('utf-8'),42516,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1276',u'我孫子'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1277',u'鴨川'.encode ('utf-8'),81256,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1278',u'銚子'.encode ('utf-8'),24374,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1279',u'市川'.encode ('utf-8'),85813,'2003-2-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
file_out = sys.argv[1]
#
print	file_out
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
csv_write_proc (file_out,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
