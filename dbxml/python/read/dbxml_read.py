#! /usr/bin/python
# -*- coding: utf-8 -*-
#	dbxml_read.py
#
#						Feb/20/2012
#
# ---------------------------------------------------------------
import os
#
import	sys
sys.path.append ('/var/www/data_base/common/python_common')
from dbxml_manipulate import dbxml_to_dict_proc
from text_manipulate import dict_display_proc
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
file_dbxml = "cities.dbxml"
#file_dbxml = "/var/tmp/dbxml/cities.dbxml"
#
dict_aa = dbxml_to_dict_proc (file_dbxml)
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
