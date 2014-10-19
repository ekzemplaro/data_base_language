#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	epub_read.py
#
#						Jul/07/2012
#
import	sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from epub_manipulate import epub_to_dict_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
file_epub = sys.argv[1]
dict_aa = epub_to_dict_proc (file_epub)
#
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

