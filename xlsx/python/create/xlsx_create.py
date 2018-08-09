#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
#	xlsx_create.py
#
#						Aug/09/2018
#
# -------------------------------------------------------------------
import sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from xlsx_manipulate import xlsx_write_proc

# -------------------------------------------------------------------
def data_prepare_proc():
	dict_aa = {}
	dict_aa = dict_append_proc(dict_aa,"t2971","奈良",729845,"2003-6-12")
	dict_aa = dict_append_proc(dict_aa,"t2972","大和高田",615973,"2003-9-15")
	dict_aa = dict_append_proc(dict_aa,"t2973","大和郡山",849371,"2003-8-17")
	dict_aa = dict_append_proc(dict_aa,"t2974","天理",245639,"2003-2-8")
	dict_aa = dict_append_proc(dict_aa,"t2975","橿原",372681,"2003-3-9")
	dict_aa = dict_append_proc(dict_aa,"t2976","桜井",837592,"2003-6-26")
	dict_aa = dict_append_proc(dict_aa,"t2977","五條",924638,"2003-8-23")
	dict_aa = dict_append_proc(dict_aa,"t2978","御所",481765,"2003-10-20")
	dict_aa = dict_append_proc(dict_aa,"t2979","生駒",647329,"2003-12-9")
#
	return	dict_aa
# -------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")

xlsx_file = sys.argv[1]
print(xlsx_file)
#
dict_aa = data_prepare_proc()
#
xlsx_write_proc(xlsx_file,dict_aa)
#
sys.stderr.write("*** 終了 ***\n")
# -------------------------------------------------------------------
