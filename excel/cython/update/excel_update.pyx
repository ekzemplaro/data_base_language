#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	update/excel_update.py
#
#					Jul/05/2011
import	sys
import	string
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
from excel_manipulate import excel_read_proc
from excel_manipulate import excel_write_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
excel_file = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))

dict_aa = excel_read_proc	(excel_file)

dict_bb = dict_update_proc (dict_aa,id_in,population_in)

excel_write_proc (excel_file,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
