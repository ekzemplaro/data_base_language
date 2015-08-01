#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	json_read.py
#
#					May/27/2015
#
#
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_file_io import file_to_str_proc
from text_manipulate import dict_display_proc
# -------------------------------------------------------------
print	("*** 開始 ***")
#
file_in = sys.argv[1]
#
json_str = file_to_str_proc (file_in)
#
dict_aa = json.loads (json_str)
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
# -------------------------------------------------------------
