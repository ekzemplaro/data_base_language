# -*- coding: utf-8 -*-
#
#	csv_create.pyx
#
#					Oct/21/2014
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
	dict_aa = dict_append_proc (dict_aa,'t1271','千葉',59178,'1949-9-21')
	dict_aa = dict_append_proc (dict_aa,'t1272','勝浦',47285,'1949-10-15')
	dict_aa = dict_append_proc (dict_aa,'t1273','市原',82654,'1949-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1274','流山',94251,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1275','八千代',42516,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1276','我孫子',35187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1277','鴨川',81756,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1278','銚子',29374,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1279','市川',85613,'1949-2-17')
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
