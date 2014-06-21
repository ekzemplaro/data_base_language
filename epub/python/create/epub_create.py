#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	epub_create.py
#
#					Jul/06/2012
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from epub_manipulate import dict_to_epub_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1931',u'甲府',76824,'2003-5-8')
	dict_aa = dict_append_proc (dict_aa,'t1932',u'富士吉田',17328,'2003-1-12')
	dict_aa = dict_append_proc (dict_aa,'t1933',u'都留',72395,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1934',u'山梨',62463,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1935',u'大月',42931,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1936',u'韮崎',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1937',u'南アルプス',81256,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1938',u'北杜',78435,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1939',u'甲斐',82391,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
file_epub = sys.argv[1]
print	file_epub
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
dict_to_epub_proc (file_epub,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------

