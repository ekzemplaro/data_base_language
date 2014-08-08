#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	xml_python_create.py
#
#						Jul/25/2014
# -------------------------------------------------------------------------
import	sys
import	os
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from xml_manipulate import dict_to_xml_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2261',u'静岡',48100,'2003-9-17')
#
	dict_aa = dict_append_proc (dict_aa,'t2262',u'浜松',31700,'2003-1-24')
#
	dict_aa = dict_append_proc (dict_aa,'t2263',u'沼津',71500,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2264',u'三島',91200,'2003-1-15')
	dict_aa = dict_append_proc (dict_aa,'t2265',u'富士',34200,'2003-5-19')
	dict_aa = dict_append_proc (dict_aa,'t2266',u'熱海',61500,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2267',u'富士宮',21800,'2003-3-11')
	dict_aa = dict_append_proc (dict_aa,'t2268',u'藤枝',43100,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2269',u'御殿場',31500,'2003-8-23')
	dict_aa = dict_append_proc (dict_aa,'t2270',u'島田',42900,'2003-5-4')
#
#
	return	dict_aa
#
# -------------------------------------------------------------------------
xml_file = "/var/tmp/xml_file/cities.xml"
#
dict_aa = data_prepare_proc ()
#
print ("Content-type: text/html\n\n")
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str)
#
os.chmod (xml_file,0o666)
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
