#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pdf_read.py
#
#						Sep/09/2014
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from pdf_manipulate import pdf_to_dict_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
file_pdf = sys.argv[1]
dict_aa = pdf_to_dict_proc (file_pdf)
#
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

