#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	xlsx_create.py
#
#						Jul/30/2013
#
# -------------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from xlsx_manipulate import xlsx_write_proc

#from openpyxl import Workbook
# -------------------------------------------------------------------
def data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,"t2971",u"奈良",72845,"2003-6-12")
	dict_aa = dict_append_proc (dict_aa,"t2972",u"大和高田",81973,"2003-9-15")
	dict_aa = dict_append_proc (dict_aa,"t2973",u"大和郡山",64371,"2003-8-17")
	dict_aa = dict_append_proc (dict_aa,"t2974",u"天理",24639,"2003-2-8")
	dict_aa = dict_append_proc (dict_aa,"t2975",u"橿原",37681,"2003-3-9")
	dict_aa = dict_append_proc (dict_aa,"t2976",u"桜井",83592,"2003-6-26")
	dict_aa = dict_append_proc (dict_aa,"t2977",u"五條",92438,"2003-8-23")
	dict_aa = dict_append_proc (dict_aa,"t2978",u"御所",48765,"2003-10-20")
	dict_aa = dict_append_proc (dict_aa,"t2979",u"生駒",64129,"2003-12-9")
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
