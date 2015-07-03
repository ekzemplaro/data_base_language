# -*- coding: utf-8 -*-
#
#	create/couch_create.pyx
#
#					Jun/02/2015
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
	dict_aa = dict_append_proc (dict_aa,'t2021',u'長野',79123,'1925-2-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2022',u'松本',31697,'1925-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023',u'上田',81472,'1925-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2024',u'小諸',56238,'1925-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2025',u'岡谷',72896,'1925-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026',u'塩尻',84129,'1925-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027',u'茅野',96357,'1925-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028',u'飯田',53671,'1925-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029',u'中野',64287,'1925-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030',u'諏訪',82154,'1925-7-04')
	dict_aa = dict_append_proc (dict_aa,'t2031',u'駒ヶ根',72681,'1925-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032',u'佐久',28743,'1925-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033',u'伊那',12759,'1925-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034',u'千曲',62531,'1925-8-17')
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
