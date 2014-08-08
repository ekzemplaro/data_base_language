#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	xml_create.py
#
#				Jul/25/2014
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
	dict_aa = dict_append_proc (dict_aa,'t2261','静岡',48157,'2003-4-7')
#
	dict_aa = dict_append_proc (dict_aa,'t2262','浜松',32785,'2003-5-4')
#
	dict_aa = dict_append_proc (dict_aa,'t2263','沼津',76954,'2003-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2264','三島',91368,'2003-9-15')
	dict_aa = dict_append_proc (dict_aa,'t2265','富士',37246,'2003-6-29')
	dict_aa = dict_append_proc (dict_aa,'t2266','熱海',61529,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2267','富士宮',21857,'2003-3-11')
	dict_aa = dict_append_proc (dict_aa,'t2268','藤枝',41679,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2269','御殿場',34982,'2003-8-23')
	dict_aa = dict_append_proc (dict_aa,'t2270','島田',42753,'2003-10-4')
#
#
	return	dict_aa
#
# --------------------------------------------------------------------
print	("*** 開始 ***")
#
xml_file = sys.argv[1]
#
print	(xml_file)
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str)
#
print	("*** 終了 ***")
# --------------------------------------------------------------------
