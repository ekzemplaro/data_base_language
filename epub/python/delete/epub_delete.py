#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	epub_delete.py
#
#						Sep/17/2014
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
from epub_manipulate import epub_to_dict_proc
from epub_manipulate import dict_to_epub_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
file_pdf = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)
#
dict_aa = epub_to_dict_proc (file_pdf)
dict_aa=dict_delete_proc (dict_aa,id_in)
#
dict_to_epub_proc (file_pdf,dict_aa)
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

