#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
#	xlsx_read.py
#
#						Sep/08/2014
#
# -------------------------------------------------------------------
import sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from xlsx_manipulate import xlsx_read_proc

# -------------------------------------------------------------------
print   ("*** 開始 ***")

xlsx_file = sys.argv[1]
print (xlsx_file)
#
dict_aa = xlsx_read_proc (xlsx_file)

dict_display_proc	(dict_aa)

print ("*** 終了 ***")
# -------------------------------------------------------------------
