#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	json_read.py
#
#					Jun/07/2017
#
# ------------------------------------------------------------------
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from file_io import file_to_str_proc
#
# ------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
file_in = sys.argv[1]
sys.stderr.write(file_in + "\n")
#
try:
	json_str = file_to_str_proc(file_in)
except Exception as ee:
	sys.stderr.write("*** error *** in file_to_str_proc ***\n")
	sys.stderr.write(str(ee) + "\n")
#
dict_aa = json.loads(json_str)
#
dict_display_proc(dict_aa)
#
sys.stderr.write("*** 終了 ***\n")
# ------------------------------------------------------------------
