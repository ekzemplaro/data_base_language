# -*- coding: utf-8 -*-
#
#	text_read.pyx
#
#						Oct/26/2011
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
from text_manipulate import dict_display_proc

# --------------------------------------------------------------------
print ("*** 開始 ***")
file_in = sys.argv[1]
#
dict_aa = text_read_proc (file_in)
print dict_aa.keys ()
#
dict_display_proc (dict_aa)
print ("*** 終了 ***")
# --------------------------------------------------------------------
