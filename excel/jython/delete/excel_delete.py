#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	excel_delete.py
#					Aug/08/2013
#
# ----------------------------------------------------------------
import	sys
import	string
#
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_update_proc
from jython_text_manipulate import jython_dict_display_proc
from jython_excel_manipulate import jython_excel_read_proc
from jython_excel_manipulate import jython_excel_write_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
excel_file = sys.argv[1]
key = sys.argv[2]
print ("%s" % key)
#
dict_aa = jython_excel_read_proc (excel_file)
#
if key in dict_aa:
	del dict_aa[key]
	jython_dict_display_proc (dict_aa)
	jython_excel_write_proc (excel_file,dict_aa)
#
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
