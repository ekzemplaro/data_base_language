#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cdb_read.py
#
#					Mar/26/2013
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from cdb_manipulate import cdb_read_proc
# ---------------------------------------------------------------------
print "*** 開始 ***"
#
file_cdb = sys.argv[1]

dict_aa = cdb_read_proc (file_cdb)
dict_display_proc (dict_aa)
#
print "*** 終了 ***"
# ---------------------------------------------------------------------
