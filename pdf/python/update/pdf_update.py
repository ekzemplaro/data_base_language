#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pdf_update.py
#
#						Sep/09/2014
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_update_proc
from pdf_manipulate import pdf_to_dict_proc
from pdf_manipulate import dict_to_pdf_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
file_pdf = sys.argv[1]
id_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))
#
dict_aa = pdf_to_dict_proc (file_pdf)
dict_aa=dict_update_proc (dict_aa,id_in,population_in)
#
dict_to_pdf_proc (file_pdf,dict_aa)
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

