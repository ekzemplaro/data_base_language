#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	delete/csv_delete.py
#
#					Nov/04/2016
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import csv_write_proc
from text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
#
sys.stderr.write ("*** 開始 ***\n")
#
file_in = sys.argv[1]
key_in = sys.argv[2]
print ("%s" % key_in)

dict_aa = csv_read_proc	(file_in)

dict_bb = dict_delete_proc (dict_aa,key_in)

csv_write_proc (file_in,dict_bb)
#
sys.stderr.write ("*** 終了 ***\n")
# ---------------------------------------------------------------
