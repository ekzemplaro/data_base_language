#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	json_read.py
#
#					Jul/25/2014
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
json_str = file_to_str_proc (file_in)
#
dict_aa = json.loads (json_str)
#
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------
