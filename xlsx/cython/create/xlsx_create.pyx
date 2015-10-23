# -*- coding: utf-8 -*-
#
#	xlsx_create.pyx
#
#						Jul/03/2015
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
	dict_aa = dict_append_proc (dict_aa,"t2971",u"奈良",721845,"1949-6-12")
	dict_aa = dict_append_proc (dict_aa,"t2972",u"大和高田",815973,"1949-9-15")
	dict_aa = dict_append_proc (dict_aa,"t2973",u"大和郡山",649371,"1949-8-17")
	dict_aa = dict_append_proc (dict_aa,"t2974",u"天理",241639,"1949-2-8")
	dict_aa = dict_append_proc (dict_aa,"t2975",u"橿原",372681,"1949-3-9")
	dict_aa = dict_append_proc (dict_aa,"t2976",u"桜井",837592,"1949-6-26")
	dict_aa = dict_append_proc (dict_aa,"t2977",u"五條",924638,"1949-8-23")
	dict_aa = dict_append_proc (dict_aa,"t2978",u"御所",481765,"1949-10-20")
	dict_aa = dict_append_proc (dict_aa,"t2979",u"生駒",641329,"1949-12-9")
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
