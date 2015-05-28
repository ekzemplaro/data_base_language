#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/csv_delete.py
#
#					May/27/2015
import	sys
import	string
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import csv_read_proc
from jython_text_manipulate import csv_write_proc
from jython_text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)

dict_aa = csv_read_proc	(file_in)

dict_bb = dict_delete_proc (dict_aa,id_in)

csv_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
