#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	pdf_create.py
#
#					Aug/06/2014
# -------------------------------------------------------------------------
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from pdf_manipulate import dict_to_pdf_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2531','大津',92768,'2003-9-30')
	dict_aa = dict_append_proc (dict_aa,'t2532','草津',17524,'2003-2-10')
	dict_aa = dict_append_proc (dict_aa,'t2533','守山',73651,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2534','栗東',62963,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2535','野洲',42531,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2536','甲賀',35287,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2537','湖南',81756,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2538','近江八幡',21784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2539','彦根',79813,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
file_pdf = sys.argv[1]
print	(file_pdf)
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
dict_to_pdf_proc (file_pdf,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------

