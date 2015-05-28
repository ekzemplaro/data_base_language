#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/text_update.py
#
#					May/27/2015
import	sys
import	string
import	datetime
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import text_read_proc
from jython_text_manipulate import text_write_proc
from jython_text_manipulate import dict_update_proc
# ---------------------------------------------------------------
#
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))

dict_aa = text_read_proc	(file_in)

dict_bb=dict_update_proc (dict_aa,id_in,population_in)

#dict_display_proc	(dict_bb)
text_write_proc (file_in,dict_bb)
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
