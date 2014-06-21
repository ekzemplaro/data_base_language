#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	pdf_create.py
#
#					Feb/14/2014
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
	dict_aa = dict_append_proc (dict_aa,'t2531',u'大津',91768,'2003-9-30')
	dict_aa = dict_append_proc (dict_aa,'t2532',u'草津',17824,'2003-2-10')
	dict_aa = dict_append_proc (dict_aa,'t2533',u'守山',73652,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2534',u'栗東',62463,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2535',u'野洲',42931,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2536',u'甲賀',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2537',u'湖南',81256,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2538',u'近江八幡',26784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2539',u'彦根',75813,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
file_pdf = sys.argv[1]
print	file_pdf
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
dict_to_pdf_proc (file_pdf,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------

