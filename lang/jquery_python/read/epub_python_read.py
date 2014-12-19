#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	epub_python_read.py
#
#						Jul/09/2012
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from epub_manipulate import epub_to_dict_proc
# ---------------------------------------------------------------------
#
file_epub = "/var/tmp/epub/cities.epub"
#
#
dict_aa = epub_to_dict_proc (file_epub)
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print	(str_aa)
