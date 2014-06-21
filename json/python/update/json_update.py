#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	json_update.py
#
#				Feb/14/2011
#
# -------------------------------------------------------------------
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	datetime
import	json
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_to_str_proc
from file_io	import file_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_update_proc
# -------------------------------------------------------------------
print ("*** 開始 ***")
#
file_json = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
#
print (file_json)
print ("%s\t%d" % (id_in, population_in))
#
json_str = file_to_str_proc (file_json)
#
dict_aa = json.loads (json_str)
#
dict_bb = dict_update_proc (dict_aa,id_in,population_in)
#
dict_display_proc (dict_bb)
out_str = json.dumps (dict_bb)
#
#print	out_str
file_write_proc (file_json,out_str)
#
print ("*** 終了 ***")
# -------------------------------------------------------------------
