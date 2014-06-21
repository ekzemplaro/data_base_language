#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cdb_delete.py
#
#					Mar/26/2013
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from cdb_manipulate import cdb_read_proc
from cdb_manipulate import cdb_write_proc
# ---------------------------------------------------------------------
print "*** 開始 ***"

file_cdb = sys.argv[1]
key_in = sys.argv[2]
print (key_in)

dict_aa = cdb_read_proc (file_cdb)
#
dict_bb=dict_delete_proc (dict_aa,key_in)
#
cdb_write_proc (file_cdb,dict_bb)
#
print "*** 終了 ***"
# ---------------------------------------------------------------------
