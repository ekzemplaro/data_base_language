#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	csv_read.py
#
#						Sep/29/2014
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
print ("*** 開始 ***")
file_in = sys.argv[1]
#
dict_aa = csv_read_proc (file_in)
#
dict_display_proc (dict_aa)
print ("*** 終了 ***")
# --------------------------------------------------------------------
