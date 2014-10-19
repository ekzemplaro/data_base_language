#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	calc_create.py
#
#					Oct/03/2014
#
# -------------------------------------------------------------------
import sys
import ooolib
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from calc_manipulate import calc_write_proc

# -------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,"t4361",u"熊本",47861,"2003-5-23")
	dict_aa = dict_append_proc (dict_aa,"t4362",u"八代",91243,"2003-9-15")
	dict_aa = dict_append_proc (dict_aa,"t4363",u"人吉",24351,"2003-8-17")
	dict_aa = dict_append_proc (dict_aa,"t4364",u"水俣",81624,"2003-2-8")
	dict_aa = dict_append_proc (dict_aa,"t4365",u"玉名",37459,"2003-3-9")
	dict_aa = dict_append_proc (dict_aa,"t4366",u"山鹿",83291,"2003-6-26")
	dict_aa = dict_append_proc (dict_aa,"t4367",u"菊池",92736,"2003-8-25")
	dict_aa = dict_append_proc (dict_aa,"t4368",u"宇土",48165,"2003-10-20")
	dict_aa = dict_append_proc (dict_aa,"t4369",u"天草",64529,"2003-11-9")
#
	return	dict_aa
#
# -------------------------------------------------------------------
print	("*** 開始 ***")
#
calc_file = sys.argv[1]
#
dict_aa = data_prepare_proc ()
calc_write_proc (calc_file,dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------
