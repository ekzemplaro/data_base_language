#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dbxml_python_read.py
#						Jul/31/2012
#
# ------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from dbxml_manipulate import dbxml_to_dict_proc
#
dict_aa = dbxml_to_dict_proc ("cities.dbxml")
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa.encode('utf_8')
#
