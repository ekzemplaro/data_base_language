#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pdf_delete.py
#
#						Sep/04/2016
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from pdf_manipulate import pdf_to_dict_proc
from pdf_manipulate import dict_to_pdf_proc
# ------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
file_pdf = sys.argv[1]
key_in = sys.argv[2]
print ("%s" % key_in)
#
dict_aa = pdf_to_dict_proc (file_pdf)
dict_aa=dict_delete_proc (dict_aa,key_in)
#
dict_to_pdf_proc (file_pdf,dict_aa)
sys.stderr.write ("*** 終了 ***\n")
# ------------------------------------------------------------------

