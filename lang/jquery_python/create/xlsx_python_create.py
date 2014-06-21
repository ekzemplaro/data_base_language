#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	xlsx_python_create.py
#
#						Aug/19/2013
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from xlsx_manipulate import xlsx_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2971',u'奈良',52600,'2003-2-15')
	dict_aa = dict_append_proc (dict_aa,'t2972',u'大和高田',71500,'2003-8-12')
	dict_aa = dict_append_proc (dict_aa,'t2973',u'大和郡山',25400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2974',u'天理',67500,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t2975',u'橿原',43600,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2976',u'桜井',31700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2977',u'五條',89600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t2978',u'御所',28100,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t2979',u'生駒',75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
dict_aa = data_prepare_proc ()
#
xlsx_file = "/var/tmp/xlsx/cities.xlsx"
xlsx_write_proc (xlsx_file,dict_aa)
#
#
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
