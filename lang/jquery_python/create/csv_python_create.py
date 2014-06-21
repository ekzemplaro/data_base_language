#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	csv_python_create.py
#
#						May/11/2011
# -------------------------------------------------------------------------
import	sys
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import csv_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t1271',u'千葉'.encode ('utf-8'),71500,'2003-3-9')
	dict_aa = dict_append_proc (dict_aa,'t1272',u'勝浦'.encode ('utf-8'),62300,'2003-9-10')
	dict_aa = dict_append_proc (dict_aa,'t1273',u'市原'.encode ('utf-8'),84200,'2003-2-14')
	dict_aa = dict_append_proc (dict_aa,'t1274',u'流山'.encode ('utf-8'),62100,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t1275',u'八千代'.encode ('utf-8'),42100,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1276',u'我孫子'.encode ('utf-8'),35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1277',u'鴨川'.encode ('utf-8'),85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t1278',u'銚子'.encode ('utf-8'),28400,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t1279',u'市川'.encode ('utf-8'),75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
file_out = "/var/tmp/csv/cities.csv"
#
dict_aa = data_prepare_proc ()
#
csv_write_proc (file_out,dict_aa)
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
