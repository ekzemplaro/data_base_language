#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/couch_create.py
#
#					Oct/31/2013
#
# ----------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
import	httplib
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import jython_dict_display_proc
from jython_get_uri import get_uri_proc
from jython_get_uri import rest_put_proc
#
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021',u'長野',91237,'2004-10-17')
#
	dict_aa = dict_append_proc (dict_aa,'t2022',u'松本',32584,'2004-8-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023',u'上田',57462,'2004-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2024',u'小諸',61538,'2004-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2025',u'岡谷',72896,'2004-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026',u'塩尻',84123,'2004-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2027',u'茅野',96357,'2004-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028',u'飯田',53172,'2004-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029',u'中野',64987,'2004-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030',u'諏訪',82154,'2004-7-04')
	dict_aa = dict_append_proc (dict_aa,'t2031',u'駒ヶ根',72681,'2004-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032',u'佐久',28743,'2004-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033',u'伊那',12759,'2004-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034',u'千曲',62538,'2004-8-17')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
host = "cddn007:5984"
path = "/city/cities"
url_json = 'http://' + host + path
#
json_str = get_uri_proc (host,path)
#
#
dict_old = json.loads (json_str)
print ("_rev\t" + dict_old["_rev"])
#
dict_aa = data_prepare_proc ()
#
jython_dict_display_proc (dict_aa)
#
str_json = json.dumps (dict_aa)
#
#print (str_json)
#
url_target = url_json + '?rev=' + dict_old["_rev"]
rest_put_proc (url_target,str_json,"text/json")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
