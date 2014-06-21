#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dbxml_update.py
#
#						Jul/31/2012
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
from text_manipulate import dict_update_proc
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
file_dbxml="cities.dbxml"
#
dict_aa = dbxml_to_dict_proc (file_dbxml)
#
dict_aa = dict_update_proc (dict_aa,id_in,population_in)
#
dict_display_proc (dict_aa)
#
file_dbxml="/var/tmp/dbxml/cities.dbxml"
dict_to_dbxml_proc (dict_aa,file_dbxml)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
