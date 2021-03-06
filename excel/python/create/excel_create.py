#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	excel_create.py
#
#						Oct/16/2016
#
# -------------------------------------------------------------------
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from excel_manipulate import excel_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,"t2971",u"奈良",52819,"2003-4-12")
	dict_aa = dict_append_proc (dict_aa,"t2972",u"大和高田",81973,"2003-9-15")
	dict_aa = dict_append_proc (dict_aa,"t2973",u"大和郡山",64371,"2003-8-17")
	dict_aa = dict_append_proc (dict_aa,"t2974",u"天理",24638,"2003-2-8")
	dict_aa = dict_append_proc (dict_aa,"t2975",u"橿原",32681,"2003-3-9")
	dict_aa = dict_append_proc (dict_aa,"t2976",u"桜井",15693,"2003-6-26")
	dict_aa = dict_append_proc (dict_aa,"t2977",u"五條",91432,"2003-8-23")
	dict_aa = dict_append_proc (dict_aa,"t2978",u"御所",41765,"2003-10-20")
	dict_aa = dict_append_proc (dict_aa,"t2979",u"生駒",87124,"2003-12-9")
#
	return	dict_aa
# -------------------------------------------------------------------
print   ("*** 開始 ***")
#
excel_file = sys.argv[1]
#
dict_aa = data_prepare_proc ()
print (excel_file)
#
excel_write_proc (excel_file,dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------
