#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	derby_create.py
#
#					Jul/06/2012
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from derby_manipulate import dict_to_derby_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3551','山口',59176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t3552','下関',47935,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t3553','萩',21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t3554','徳山',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t3555','岩国',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3556','光',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3557','宇部',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3558','長門',24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3559','防府',75823,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
db_name = "city_aaa"
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
dict_to_derby_proc (db_name,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------

