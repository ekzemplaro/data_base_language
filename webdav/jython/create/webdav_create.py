#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/couch_create.py
#
#					Oct/31/2013
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
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t1351',u'八王子',95127,'2004-3-2')
#
	dict_aa = dict_append_proc (dict_aa,'t1352',u'立川',37684,'2004-8-25')
#
	dict_aa = dict_append_proc (dict_aa,'t1353',u'武蔵野',59462,'2004-4-12')
	dict_aa = dict_append_proc (dict_aa,'t1354',u'三鷹',56538,'2004-7-21')
	dict_aa = dict_append_proc (dict_aa,'t1355',u'青梅',72896,'2004-4-19')
	dict_aa = dict_append_proc (dict_aa,'t1356',u'府中',84129,'2004-10-14')
	dict_aa = dict_append_proc (dict_aa,'t1357',u'昭島',96317,'2004-5-24')
	dict_aa = dict_append_proc (dict_aa,'t1358',u'調布',63572,'2004-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1359',u'町田',61987,'2004-11-14')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_target = 'http://cddn007:3004/city/tokyo.json'
#
dict_aa = data_prepare_proc ()
#
jython_dict_display_proc (dict_aa)
#
str_json = json.dumps (dict_aa)
#
rest_put_proc (url_target,str_json,"text/json")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
