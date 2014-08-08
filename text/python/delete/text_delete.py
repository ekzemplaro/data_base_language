#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/text_delete.py
#
#					Jul/25/2014
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
from text_manipulate import text_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)

dict_aa = text_read_proc	(file_in)

dict_bb = dict_delete_proc (dict_aa,id_in)

dict_display_proc	(dict_bb)
text_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
