#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	excel_read.py
#
#						May/31/2012
#
# -------------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.path.append ('/var/www/data_base/common/python_common')
from excel_manipulate import excel_read_proc
from text_manipulate import dict_display_proc

# -------------------------------------------------------------------
print   ("*** 開始 ***")

excel_file = sys.argv[1]
print (excel_file)
#
dict_aa = excel_read_proc (excel_file)
dict_display_proc	(dict_aa)

print ("*** 終了 ***")
# -------------------------------------------------------------------
