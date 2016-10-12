#! /opt/jython/bin/jython
# -*- coding: utf-8 -*-
#
#	text_read.py
#
#						Oct/12/2016
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import text_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
file_in = sys.argv[1]
#
dict_aa = text_read_proc (file_in)
print dict_aa.keys ()
#
dict_display_proc (dict_aa)
sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------
