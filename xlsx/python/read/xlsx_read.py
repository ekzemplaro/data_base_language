#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	xlsx_read.py
#
#						Oct/14/2016
#
# -------------------------------------------------------------------
import sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from xlsx_manipulate import xlsx_read_proc

# -------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")

xlsx_file = sys.argv[1]
print (xlsx_file)
#
dict_aa = xlsx_read_proc (xlsx_file)

dict_display_proc	(dict_aa)

sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------
