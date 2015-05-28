#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	json_delete.py
#
#					May/27/2015
#
#
import	sys
import	string
import	json
#
# -------------------------------------------------------------------
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_text_manipulate import dict_delete_proc
from jython_file_io import file_to_str_proc
from jython_file_io import file_write_proc
#
# -------------------------------------------------------------------
print ("*** 開始 ***")
#
file_json = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)
#
json_str = file_to_str_proc (file_json)
#
dict_aa = json.loads (json_str)
#
dict_delete_proc (dict_aa,id_in)
#
out_str = json.dumps (dict_aa)
#
file_write_proc (file_json,out_str)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
