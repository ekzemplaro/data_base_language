#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dbxml_create.py
#
#						Feb/20/2012
#
# ---------------------------------------------------------------
import os
from bsddb3.db import *
from dbxml import *
import	sys
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from text_manipulate import dict_display_proc
from dbxml_manipulate import dict_to_dbxml_proc
# ---------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0821','山形',51876,'2003-2-20')
	dict_aa = dict_append_proc (dict_aa,'t0822','米沢',28439,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t0823','酒田',67354,'2003-8-19')
	dict_aa = dict_append_proc (dict_aa,'t0824','鶴岡',83672,'2003-10-9')
	dict_aa = dict_append_proc (dict_aa,'t0825','寒河江',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0826','天童',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0827','新庄',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0828','南陽',29784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0829','尾花沢',75423,'2003-9-12')
#
	return	dict_aa
#
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
print version()
#
dbxml_file="/var/tmp/dbxml/cities.dbxml"
dict_aa = data_prepare_proc ()
dict_to_dbxml_proc (dict_aa,dbxml_file)
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
