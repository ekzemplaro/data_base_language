#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
#	excel_read.py
#
#						Sep/08/2014
#
# -------------------------------------------------------------------
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from excel_manipulate import excel_read_proc
from text_manipulate import dict_display_proc

# -------------------------------------------------------------------
print   ("*** 開始 ***")

excel_file = sys.argv[1]
print (excel_file)
#
try:
	dict_aa = excel_read_proc (excel_file)
	dict_display_proc	(dict_aa)
except Exception as ee:
	sys.stderr.write ("*** error *** in excel_read_proc ***\n")
	sys.stderr.write (str (ee))
#
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
