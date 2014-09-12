#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	excel_delete.py
#
#					Sep/05/2014
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from excel_manipulate import excel_read_proc
from excel_manipulate import excel_write_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
excel_file = sys.argv[1]
key_in = sys.argv[2]
print ("%s" % key_in)

dict_aa = excel_read_proc	(excel_file)

dict_bb = dict_delete_proc (dict_aa,key_in)

excel_write_proc (excel_file,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
