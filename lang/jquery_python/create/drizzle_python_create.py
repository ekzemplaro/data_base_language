#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	drizzle_python_create.py
#
#						Jul/10/2012
# -------------------------------------------------------------------------
import	sys
import	string
sys.path.append ('/var/www/data_base/common/python_common')
#
from drizzle_manipulate import dict_to_drizzle_proc
from text_manipulate import dict_append_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2651','京都',31800,'2003-5-20')
	dict_aa = dict_append_proc (dict_aa,'t2652','福知山',42900,'2003-4-12')
	dict_aa = dict_append_proc (dict_aa,'t2653','舞鶴',65700,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2654','綾部',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2655','宇治',42100,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2656','宮津',38700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2657','亀岡',24600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2658','城陽',78400,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t2659','向日',75800,'2003-10-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
dict_aa = data_prepare_proc ()
#
db_name = "city"
dict_to_drizzle_proc (db_name,dict_aa)
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
