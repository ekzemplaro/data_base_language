#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	list.py
#
#						Sep/29/2015
#
#
# ---------------------------------------------------------------------
import	sys
import	json
import	glob
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
#
# ---------------------------------------------------------------------
#
lines= glob.glob("rhino/*/*.js.txt")
lines.sort ()
str_aa = json.dumps (lines)
#
print ("Content-type: text/json; charset=UTF-8\n\n")
print (str_aa)
# ---------------------------------------------------------------------

