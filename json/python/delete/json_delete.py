#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	json_delete.py
#
#					May/31/2012
#
#
# -------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_to_str_proc
from file_io import file_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_delete_proc
# -------------------------------------------------------------------
print ("*** 開始 ***")
#
file_json = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % file_json)
print ("%s" % id_in)
#
#
json_str = file_to_str_proc (file_json)
#
dict_aa = json.loads (json_str)
#
dict_bb = dict_delete_proc (dict_aa,id_in)
#
dict_display_proc (dict_bb)
out_str = json.dumps (dict_bb)
#
file_write_proc (file_json,out_str)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
