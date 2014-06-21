#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	json_update.py
#
#				Jun/20/2012
#
#
# -------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
from file_io import file_to_str_proc
from file_io import file_write_proc
# -------------------------------------------------------------------
print ("*** 開始 ***")
#
file_json = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))
#
json_str = file_to_str_proc (file_json)
#
dict_aa = json.loads (json_str)
#
dict_update_proc (dict_aa,id_in,population_in)
#
out_str = json.dumps (dict_aa)
#
file_write_proc (file_json,out_str)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
