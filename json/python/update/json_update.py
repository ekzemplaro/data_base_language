#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	json_update.py
#
#				Jul/31/2017
#
# -------------------------------------------------------------------
import	sys
import	datetime
import	json
import	string
#
sys.path.append('/var/www/data_base/common/python_common')
from file_io import file_to_str_proc
from file_io import file_write_proc
from text_manipulate import dict_update_proc
# -------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
file_json = sys.argv[1]
key_in = sys.argv[2]
population_in = int(sys.argv[3])
#
print(file_json)
print("%s\t%d" % (key_in, population_in))
#
json_str = file_to_str_proc(file_json)
#
dict_aa = json.loads(json_str)
#
dict_bb = dict_update_proc(dict_aa,key_in,population_in)
#
out_str = json.dumps(dict_bb)
#
file_write_proc(file_json,out_str)
#
sys.stderr.write("*** 終了 ***\n")
# -------------------------------------------------------------------
