#! /usr/bin/python
# -*- coding: utf-8 -*-
#	dbxml_delete.py
#
#						May/13/2011
#
# ---------------------------------------------------------------
import os
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbxml_manipulate import dbxml_to_dict_proc
from dbxml_manipulate import dict_to_dbxml_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
dict_aa = dbxml_to_dict_proc ("cities.dbxml")
#dict_aa = dbxml_to_dict_proc ("/var/tmp/dbxml/cities.dbxml")
#
dict_aa = dict_delete_proc (dict_aa,id_in)
#
dict_display_proc (dict_aa)
#
dbxml_file="/var/tmp/dbxml/cities.dbxml"
dbxml_file="cities.dbxml"
dict_to_dbxml_proc (dict_aa,dbxml_file)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
