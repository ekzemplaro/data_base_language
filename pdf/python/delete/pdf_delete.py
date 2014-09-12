#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pdf_delete.py
#
#						Sep/09/2014
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
from pdf_manipulate import pdf_to_dict_proc
from pdf_manipulate import dict_to_pdf_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
file_pdf = sys.argv[1]
key_in = sys.argv[2]
print ("%s" % key_in)
#
dict_aa = pdf_to_dict_proc (file_pdf)
dict_aa=dict_delete_proc (dict_aa,key_in)
#
dict_to_pdf_proc (file_pdf,dict_aa)
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

