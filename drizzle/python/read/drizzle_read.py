#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	drizzle_read.py
#
#						Jul/06/2012
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from drizzle_manipulate import drizzle_to_dict_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
db_name = "city"
dict_aa = drizzle_to_dict_proc (db_name)
#
dict_display_proc (dict_aa)
print	("*** 終了 ***")
# ------------------------------------------------------------------

