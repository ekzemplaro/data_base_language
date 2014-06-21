#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	csv_create.py
#
#					Jul/02/2011
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1271','千葉',91716,'2004-8-21')
	dict_aa = dict_append_proc (dict_aa,'t1272','勝浦',17285,'2004-9-19')
	dict_aa = dict_append_proc (dict_aa,'t1273','市原',72654,'2004-3-12')
	dict_aa = dict_append_proc (dict_aa,'t1274','流山',62391,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1275','八千代',42328,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1276','我孫子',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1277','鴨川',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1278','銚子',24784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1279','市川',75823,'2004-12-15')
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
#dict_display_proc (dict_aa)
#
csv_write_proc (file_out,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
