#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	update/text_update.py
#
#					Jul/31/2017
import	sys
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
from text_manipulate import text_write_proc
from text_manipulate import dict_update_proc
# ---------------------------------------------------------------
#
sys.stderr.write("*** 開始 ***\n")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
population_in = int(sys.argv[3])
print("%s\t%d" % (id_in, population_in))

dict_aa = text_read_proc(file_in)

dict_bb=dict_update_proc(dict_aa,id_in,population_in)

text_write_proc(file_in,dict_bb)
#
sys.stderr.write("*** 終了 ***\n")
# ---------------------------------------------------------------
