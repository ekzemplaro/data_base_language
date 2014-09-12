#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	excel_python_create.py
#
#						Sep/05/2014
# -------------------------------------------------------------------------
import	sys
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from excel_manipulate import excel_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2971',u'奈良',91500,'2003-8-9')
	dict_aa = dict_append_proc (dict_aa,'t2972',u'大和高田',37200,'2003-4-10')
	dict_aa = dict_append_proc (dict_aa,'t2973',u'大和郡山',25400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2974',u'天理',62700,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t2975',u'橿原',42600,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2976',u'桜井',35100,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2977',u'五條',85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t2978',u'御所',28100,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t2979',u'生駒',79300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
excel_file = "/var/tmp/excel/cities.xls"
excel_write_proc (excel_file,dict_aa)
#
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
