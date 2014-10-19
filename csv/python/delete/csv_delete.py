#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/csv_delete.py
#
#					Sep/29/2014
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import csv_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)

dict_aa = csv_read_proc	(file_in)

dict_bb = dict_delete_proc (dict_aa,id_in)

dict_display_proc	(dict_bb)
csv_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
