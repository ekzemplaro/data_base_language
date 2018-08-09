#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	xlsx_update.py
#
#					Aug/09/2018
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
from xlsx_manipulate import xlsx_read_proc
from xlsx_manipulate import xlsx_write_proc
# ---------------------------------------------------------------
#
sys.stderr.write("*** 開始 ***\n")
#
xlsx_file = sys.argv[1]
key = sys.argv[2]
population_in = int(sys.argv[3])
print("%s\t%d" % (key, population_in))

dict_aa = xlsx_read_proc(xlsx_file)

dict_bb = dict_update_proc(dict_aa,key,population_in)

xlsx_write_proc(xlsx_file,dict_bb)
#
sys.stderr.write("*** 終了 ***\n")
# ---------------------------------------------------------------
