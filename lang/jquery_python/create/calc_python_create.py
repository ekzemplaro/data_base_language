#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	calc_python_create.py
#
#						Jun/27/2012
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from calc_manipulate import calc_write_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t4361',u'熊本',54900,'2003-6-9')
	dict_aa = dict_append_proc (dict_aa,'t4362',u'八代',28300,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t4363',u'人吉',54700,'2003-8-14')
	dict_aa = dict_append_proc (dict_aa,'t4364',u'水俣',62500,'2003-4-9')
	dict_aa = dict_append_proc (dict_aa,'t4365',u'玉名',42600,'2003-10-4')
	dict_aa = dict_append_proc (dict_aa,'t4366',u'山鹿',35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4367',u'菊池',85600,'2003-12-23')
	dict_aa = dict_append_proc (dict_aa,'t4368',u'宇土',28100,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t4369',u'天草',75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
dict_aa = data_prepare_proc ()
#
#
calc_file = "/var/tmp/calc/cities.ods"
calc_write_proc (calc_file,dict_aa);
#
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
