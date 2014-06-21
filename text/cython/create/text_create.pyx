# -*- coding: utf-8 -*-
#
#	text_create.pyx
#
#					Mar/29/2013
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
	dict_aa = dict_append_proc (dict_aa,'t2381',u'名古屋'.encode ('utf-8'),59176,'1949-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2382',u'豊橋'.encode ('utf-8'),47235,'1949-2-15')
	dict_aa = dict_append_proc (dict_aa,'t2383',u'岡崎'.encode ('utf-8'),21654,'1949-7-14')
	dict_aa = dict_append_proc (dict_aa,'t2384',u'一宮'.encode ('utf-8'),83672,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2385',u'蒲郡'.encode ('utf-8'),42391,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2386',u'常滑'.encode ('utf-8'),35187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2387',u'大府'.encode ('utf-8'),81246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2388',u'瀬戸'.encode ('utf-8'),23784,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2389',u'犬山'.encode ('utf-8'),75823,'1949-12-15')
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
text_write_proc (file_out,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
