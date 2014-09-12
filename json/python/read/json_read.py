#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	json_read.py
#
#					Sep/08/2014
#
# ------------------------------------------------------------------
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from file_io import file_to_str_proc
#
print	("*** 開始 ***")
#
file_in = sys.argv[1]
print	(file_in)
#
try:
	json_str = file_to_str_proc (file_in)
except Exception as ee:
	sys.stderr.write ("*** error *** in file_to_str_proc ***\n")
	sys.stderr.write (str (ee))
#
dict_aa = json.loads (json_str)
#
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------
