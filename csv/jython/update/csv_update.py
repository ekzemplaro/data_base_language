#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/csv_update.py
#
#					Jul/20/2015
import	sys
import	string
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import csv_read_proc
from jython_text_manipulate import csv_write_proc
from text_manipulate import dict_update_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))

dict_aa = csv_read_proc	(file_in)

dict_bb=dict_update_proc (dict_aa,id_in,population_in)

#dict_display_proc	(dict_bb)
csv_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
