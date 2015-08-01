#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	csv_python_create.py
#
#						Jul/20/2015
# -------------------------------------------------------------------------
import	sys
import	json
import	os
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import csv_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t1271','千葉',71500,'2003-3-9')
	dict_aa = dict_append_proc (dict_aa,'t1272','勝浦',62300,'2003-9-10')
	dict_aa = dict_append_proc (dict_aa,'t1273','市原',84200,'2003-2-14')
	dict_aa = dict_append_proc (dict_aa,'t1274','流山',62100,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t1275','八千代',47500,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1276','我孫子',35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1277','鴨川',85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t1278','銚子',28400,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t1279','市川',75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
file_out = "/var/tmp/csv/cities.csv"
#
dict_aa = data_prepare_proc ()
#
if os.path.isfile(file_out):
	os.remove (file_out)
#
csv_write_proc (file_out,dict_aa)
os.chmod (file_out,0o666)
#
print ("Content-type: text/html\n\n")
#
print ("*** OK ***<p />")
# -------------------------------------------------------------------------
