#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	csv_read.py
#
#						Nov/04/2016
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
file_in = sys.argv[1]
#
dict_aa = csv_read_proc (file_in)
#
dict_display_proc (dict_aa)
sys.stderr.write ("*** 終了 ***\n")
# --------------------------------------------------------------------
