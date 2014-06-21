# -*- coding: utf-8 -*-
#
#	create/couch_create.pyx
#
#					Mar/29/2013
#
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from curl_get import couch_drop_proc
from curl_get import curl_put_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021',u'長野',59823,'1925-2-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2022',u'松本',31687,'1925-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023',u'上田',51462,'1925-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2024',u'小諸',51538,'1925-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2025',u'岡谷',72896,'1925-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026',u'塩尻',84129,'1925-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027',u'茅野',96359,'1925-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028',u'飯田',53579,'1925-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029',u'中野',64987,'1925-11-14')
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
url_collection = 'http://host_dbase:5984/city'
url_target = url_collection + '/cities'
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
#
couch_drop_proc (url_collection)
#
out_str = json.dumps (dict_aa)
#
curl_put_proc (url_target,out_str)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
