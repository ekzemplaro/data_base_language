#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	drizzle_create.py
#
#					Jul/06/2012
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from drizzle_manipulate import dict_to_drizzle_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2651',u'京都',17628,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t2652',u'福知山',87235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t2653',u'舞鶴',65429,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2654',u'綾部',83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2655',u'宇治',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2656',u'宮津',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2657',u'亀岡',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2658',u'城陽',24785,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2659',u'向日',71823,'2003-12-15')
#
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
db_name = "city"
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
dict_to_drizzle_proc (db_name,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------

