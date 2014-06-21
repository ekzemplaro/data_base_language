#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	calc_update.py
#
#					Jun/26/2012
#
# -------------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
import ooolib

sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_update_proc
from calc_manipulate import calc_read_proc
from calc_manipulate import calc_write_proc
# -------------------------------------------------------------------
print   ("*** 開始 ***")
#
file_calc = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))
#
dict_aa = calc_read_proc (file_calc)
#
dict_bb = dict_update_proc (dict_aa,id_in,population_in)

calc_write_proc (file_calc,dict_bb)
#
dict_display_proc	(dict_bb)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
