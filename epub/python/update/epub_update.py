#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	epub_update.py
#
#						Jul/06/2012
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_update_proc
from epub_manipulate import epub_to_dict_proc
from epub_manipulate import dict_to_epub_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
file_pdf = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))
#
dict_aa = epub_to_dict_proc (file_pdf)
dict_aa=dict_update_proc (dict_aa,id_in,population_in)
#
dict_to_epub_proc (file_pdf,dict_aa)
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

