#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	excel_read.py
#					Aug/08/2013
#
# ----------------------------------------------------------------
import	sys
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_append_proc
from jython_text_manipulate import jython_dict_display_proc
from jython_excel_manipulate import jython_excel_read_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
excel_file = sys.argv[1]
#
dict_aa = jython_excel_read_proc (excel_file)
#
jython_dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
