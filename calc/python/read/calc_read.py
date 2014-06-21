#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	calc_read.py
#
#					Apr/18/2011
#
# -------------------------------------------------------------------
import sys
import ooolib

sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from calc_manipulate import calc_read_proc
# -------------------------------------------------------------------
print   ("*** 開始 ***")
#
if len(sys.argv) != 2:
    print "Usage:\n\t%s FILENAME.ods\n" % sys.argv[0]
    sys.exit(0)
#
file_calc = sys.argv[1]
#
dict_aa = calc_read_proc (file_calc)
#
dict_display_proc	(dict_aa)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
