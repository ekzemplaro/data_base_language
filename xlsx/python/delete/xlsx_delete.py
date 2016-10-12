#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	xlsx_delete.py
#
#					Sep/29/2016
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from xlsx_manipulate import xlsx_read_proc
from xlsx_manipulate import xlsx_write_proc
# ---------------------------------------------------------------
#
sys.stderr.write ("*** 開始 ***\n")
#
xlsx_file = sys.argv[1]
key = sys.argv[2]
print ("%s" % key)

dict_aa = xlsx_read_proc	(xlsx_file)

dict_bb = dict_delete_proc (dict_aa,key)

xlsx_write_proc (xlsx_file,dict_bb)
#
sys.stderr.write ("*** 終了 ***\n")
# ---------------------------------------------------------------
