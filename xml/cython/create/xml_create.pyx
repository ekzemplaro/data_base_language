# -*- coding: utf-8 -*-
#
#	xml_create.pyx
#
#				Mar/27/2013
#
#
# --------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
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
	dict_aa = dict_append_proc (dict_aa,'t2261',u'静岡',48157,'1950-4-7')
#
	dict_aa = dict_append_proc (dict_aa,'t2262',u'浜松',36785,'1950-5-4')
#
	dict_aa = dict_append_proc (dict_aa,'t2263',u'沼津',72654,'1950-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2264',u'三島',95168,'1950-9-15')
	dict_aa = dict_append_proc (dict_aa,'t2265',u'富士',37246,'1950-6-29')
	dict_aa = dict_append_proc (dict_aa,'t2266',u'熱海',64529,'1950-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2267',u'富士宮',28357,'1950-3-11')
	dict_aa = dict_append_proc (dict_aa,'t2268',u'藤枝',42679,'1950-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2269',u'御殿場',31982,'1950-8-23')
	dict_aa = dict_append_proc (dict_aa,'t2270',u'島田',42753,'1950-10-4')
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
file_write_proc (xml_file,out_str.encode('utf-8'))
#
print	("*** 終了 ***")
# --------------------------------------------------------------------
