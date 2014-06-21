#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	xlsx_read.py
#					Aug/07/2013
#
# ----------------------------------------------------------------
import	sys
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_append_proc
from jython_text_manipulate import jython_dict_display_proc
from jython_xlsx_manipulate import jython_xlsx_read_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
xlsx_file = sys.argv[1]
#
dict_aa = jython_xlsx_read_proc (xlsx_file)
#
jython_dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
