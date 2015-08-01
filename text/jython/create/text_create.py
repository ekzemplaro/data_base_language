#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	text_create.py
#
#					Jul/20/2015
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import text_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',32174,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',17825,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',72614,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',69482,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',47351,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',23784,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',75823,'2004-12-15')
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
#
text_write_proc (file_out,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
