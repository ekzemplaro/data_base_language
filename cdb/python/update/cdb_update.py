#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cdb_update.py
#
#					Mar/26/2013
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
from cdb_manipulate import cdb_read_proc
from cdb_manipulate import cdb_write_proc
# ---------------------------------------------------------------------
print "*** 開始 ***"

file_cdb = sys.argv[1]
key_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (key_in, population_in))

dict_aa = cdb_read_proc (file_cdb)
#
dict_bb=dict_update_proc (dict_aa,key_in,population_in)
#
cdb_write_proc (file_cdb,dict_bb)
#
print "*** 終了 ***"
# ---------------------------------------------------------------------
