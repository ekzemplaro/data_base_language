#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	csv_read.py
#
#						Jun/26/2017
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
file_in = sys.argv[1]
#
try:
	dict_aa = csv_read_proc(file_in)
	dict_display_proc(dict_aa)
except Exception as ee:
	sys.stderr.write(str(ee) + "\n")
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
