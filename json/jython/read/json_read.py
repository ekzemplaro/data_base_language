#! /opt/jython/bin/jython
# -*- coding: utf-8 -*-
#
#	json_read.py
#
#					Oct/12/2016
#
#
import	sys
import	json
#
reload(sys)
sys.setdefaultencoding("utf-8")
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_file_io import file_to_str_proc
from text_manipulate import dict_display_proc
# -------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
file_in = sys.argv[1]
#
json_str = file_to_str_proc (file_in)
#
dict_aa = json.loads (json_str)
dict_display_proc (dict_aa)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------
