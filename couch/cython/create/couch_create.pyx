# -*- coding: utf-8 -*-
#
#	create/couch_create.pyx
#
#					Oct/02/2015
#
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
from couch_manipulate import dict_to_couch_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021','長野',79123,'1949-2-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2022','松本',32697,'1949-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023','上田',85472,'1949-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2024','小諸',56218,'1949-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2025','岡谷',72896,'1949-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026','塩尻',84129,'1949-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027','茅野',96357,'1949-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028','飯田',53671,'1949-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029','中野',64287,'1949-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030','諏訪',82154,'1949-7-04')
	dict_aa = dict_append_proc (dict_aa,'t2031','駒ヶ根',72681,'1949-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032','佐久',28743,'1949-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033','伊那',12759,'1949-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034','千曲',62531,'1949-8-17')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_collection = 'http://localhost:5984/nagano'
#
dict_aa = data_prepare_proc ()
#
dict_to_couch_proc (dict_aa,url_collection)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
