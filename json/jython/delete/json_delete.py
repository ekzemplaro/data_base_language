#! /opt/jython/bin/jython
# -*- coding: utf-8 -*-
#
#	json_delete.py
#
#					Oct/12/2016
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
sys.stderr.write ("*** 開始 ***\n")
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
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------
