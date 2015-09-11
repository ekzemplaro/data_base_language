#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
#	xlsx_create.py
#
#						Sep/09/2014
#
# -------------------------------------------------------------------
import sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from xlsx_manipulate import xlsx_write_proc

#from openpyxl import Workbook
# -------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,"t2971",u"奈良",729845,"2003-6-12")
	dict_aa = dict_append_proc (dict_aa,"t2972",u"大和高田",815973,"2003-9-15")
	dict_aa = dict_append_proc (dict_aa,"t2973",u"大和郡山",649371,"2003-8-17")
	dict_aa = dict_append_proc (dict_aa,"t2974",u"天理",245639,"2003-2-8")
	dict_aa = dict_append_proc (dict_aa,"t2975",u"橿原",372681,"2003-3-9")
	dict_aa = dict_append_proc (dict_aa,"t2976",u"桜井",837592,"2003-6-26")
	dict_aa = dict_append_proc (dict_aa,"t2977",u"五條",924638,"2003-8-23")
	dict_aa = dict_append_proc (dict_aa,"t2978",u"御所",481765,"2003-10-20")
	dict_aa = dict_append_proc (dict_aa,"t2979",u"生駒",647329,"2003-12-9")
#
	return	dict_aa
# -------------------------------------------------------------------
print   ("*** 開始 ***")

xlsx_file = sys.argv[1]
print (xlsx_file)
#
dict_aa = data_prepare_proc ()
#
xlsx_write_proc (xlsx_file,dict_aa)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
