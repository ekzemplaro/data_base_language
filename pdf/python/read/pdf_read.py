#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pdf_read.py
#
#						Sep/04/2016
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from pdf_manipulate import pdf_to_dict_proc
# ------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
file_pdf = sys.argv[1]
dict_aa = pdf_to_dict_proc (file_pdf)
#
dict_display_proc (dict_aa)
sys.stderr.write ("*** 終了 ***\n")
# ------------------------------------------------------------------

