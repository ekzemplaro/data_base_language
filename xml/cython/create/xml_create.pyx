# -*- coding: utf-8 -*-
#
#	xml_create.pyx
#
#				Oct/21/2014
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
	dict_aa = dict_append_proc (dict_aa,'t2261','静岡',48157,'1950-4-7')
	dict_aa = dict_append_proc (dict_aa,'t2262','浜松',36785,'1950-5-4')
	dict_aa = dict_append_proc (dict_aa,'t2263','沼津',72654,'1950-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2264','三島',95128,'1950-9-15')
	dict_aa = dict_append_proc (dict_aa,'t2265','富士',37246,'1950-6-29')
	dict_aa = dict_append_proc (dict_aa,'t2266','熱海',64519,'1950-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2267','富士宮',28357,'1950-3-11')
	dict_aa = dict_append_proc (dict_aa,'t2268','藤枝',42679,'1950-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2269','御殿場',37982,'1950-8-23')
	dict_aa = dict_append_proc (dict_aa,'t2270','島田',41753,'1950-10-4')
#
#
	return	dict_aa
#
# --------------------------------------------------------------------
print	("*** 開始 ***")
#
xml_file = sys.argv[1]
#
print	xml_file
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
out_str = dict_to_xml_proc (dict_aa)
# file_write_proc (xml_file,out_str.encode('utf-8'))
file_write_proc (xml_file,out_str)
#
print	("*** 終了 ***")
# --------------------------------------------------------------------
