#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	text_read.py
#
#						Sep/08/2014
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
print ("*** 開始 ***")
file_in = sys.argv[1]
#
try:
	dict_aa = text_read_proc (file_in)
	dict_display_proc (dict_aa)
except Exception as ee:
	sys.stderr.write ("*** error *** in text_read_proc ***\n")
	sys.stderr.write (str (ee))
#
#
print ("*** 終了 ***")
# --------------------------------------------------------------------
