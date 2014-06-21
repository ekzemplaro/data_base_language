#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	xlsx_update.py
#					Aug/07/2013
#
# ----------------------------------------------------------------
import	sys
import	string
#
#
# ----------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from text_manipulate import dict_update_proc
from jython_text_manipulate import jython_dict_display_proc
from jython_xlsx_manipulate import jython_xlsx_read_proc
from jython_xlsx_manipulate import jython_xlsx_write_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
xlsx_file = sys.argv[1]
key = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (key, population_in))
#
dict_aa = jython_xlsx_read_proc (xlsx_file)
#
if key in dict_aa:
	dict_aa=dict_update_proc (dict_aa,key,population_in)
	jython_dict_display_proc (dict_aa)
	jython_xlsx_write_proc (xlsx_file,dict_aa)
#
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
