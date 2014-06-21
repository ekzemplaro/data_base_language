#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	csv_read.py
#
#						Feb/22/2011
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import csv_read_proc
from jython_text_manipulate import jython_dict_display_proc

# --------------------------------------------------------------------
print ("*** 開始 ***")
file_in = sys.argv[1]
#
dict_aa = csv_read_proc (file_in)
print dict_aa.keys ()
#
jython_dict_display_proc (dict_aa)
print ("*** 終了 ***")
# --------------------------------------------------------------------
