# -*- coding: utf-8 -*-
#
#	text_create.pyx
#
#					Oct/21/2014
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',59176,'1949-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',47235,'1949-2-15')
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',21674,'1949-7-14')
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',83612,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',42391,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',35187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',91246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',23784,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',75823,'1949-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
file_out = sys.argv[1]
#
print	(file_out)
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
text_write_proc (file_out,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
