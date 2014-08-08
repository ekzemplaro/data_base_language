#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	update/csv_update.py
#
#					Jul/25/2014
import	sys
import	string
import	datetime
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import csv_write_proc
from text_manipulate import dict_update_proc
from text_manipulate import dict_display_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
key_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (key_in, population_in))

dict_aa = csv_read_proc	(file_in)

dict_bb=dict_update_proc (dict_aa,key_in,population_in)

dict_display_proc	(dict_bb)
csv_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
