#! /opt/jython/bin/jython
# -*- coding: utf-8 -*-
#
#	delete/text_delete.py
#
#					Oct/12/2016
import	sys
import	string
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import text_read_proc
from jython_text_manipulate import text_write_proc
#
from text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
#
sys.stderr.write ("*** 開始 ***\n")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)

dict_aa = text_read_proc	(file_in)

dict_bb = dict_delete_proc (dict_aa,id_in)

text_write_proc (file_in,dict_bb)
#
sys.stderr.write ("*** 終了 ***\n")
# ---------------------------------------------------------------
