#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	json_delete.py
#
#					Aug/29/2018
#
#
# -------------------------------------------------------------------
import	sys
import	os
import	json
#
sys.path.append('/var/www/data_base/common/python_common')
from file_io import file_to_str_proc
from file_io import file_write_proc
from text_manipulate import dict_delete_proc
# -------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
file_json = sys.argv[1]
key_in = sys.argv[2]
print("%s" % file_json)
print("%s" % key_in)
#
if os.path.exists(file_json):
	json_str = file_to_str_proc(file_json)
	dict_aa = json.loads(json_str)
	dict_bb = dict_delete_proc(dict_aa,key_in)
	out_str = json.dumps(dict_bb)
	file_write_proc(file_json,out_str)
else:
	sys.stderr.write("*** error *** %s doesn't exist ***\n" % file_json)
#
sys.stderr.write("*** 終了 ***\n")
# -------------------------------------------------------------------
