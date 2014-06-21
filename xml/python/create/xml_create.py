#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	xml_create.py
#
#				Jul/20/2011
#
#
# --------------------------------------------------------------------
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from xml_manipulate import dict_to_xml_proc
from file_io import file_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
# --------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2261',u'静岡',48157,'2003-4-7')
#
	dict_aa = dict_append_proc (dict_aa,'t2262',u'浜松',31785,'2003-5-4')
#
	dict_aa = dict_append_proc (dict_aa,'t2263',u'沼津',72754,'2003-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2264',u'三島',91868,'2003-9-15')
	dict_aa = dict_append_proc (dict_aa,'t2265',u'富士',34246,'2003-6-29')
	dict_aa = dict_append_proc (dict_aa,'t2266',u'熱海',61529,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2267',u'富士宮',21757,'2003-3-11')
	dict_aa = dict_append_proc (dict_aa,'t2268',u'藤枝',42679,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2269',u'御殿場',34982,'2003-8-23')
	dict_aa = dict_append_proc (dict_aa,'t2270',u'島田',42753,'2003-10-4')
#
#
	return	dict_aa
#
# --------------------------------------------------------------------
print	("*** 開始 ***")
#
reload(sys)
sys.setdefaultencoding('utf-8')
xml_file = sys.argv[1]
#
print	xml_file
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str.encode('utf-8'))
#
print	("*** 終了 ***")
# --------------------------------------------------------------------
