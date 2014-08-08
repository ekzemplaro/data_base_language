#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	json_python_create.py
#
#						Aug/05/2014
# -------------------------------------------------------------------------
import	sys
import	os
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0921','宇都宮',47200,'2003-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t0922','小山',31500,'2003-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t0923','佐野',56400,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t0924','足利',57800,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t0925','日光',72100,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t0926','下野',84900,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t0927','さくら',26500,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t0928','矢板',53700,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0929','真岡',64800,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t0930','栃木',82400,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t0931','大田原',72600,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t0932','鹿沼',25700,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t0933','那須塩原',12900,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t0934','那須烏山',62800,'2003-8-17')
#
	return	dict_aa

#
# -------------------------------------------------------------------------
file_out = "/var/tmp/json/cities.json"
#
dict_aa = data_prepare_proc ()
#
out_str = json.dumps (dict_aa)
os.remove (file_out)
file_write_proc (file_out,out_str)
os.chmod (file_out,0o666)
#
print ("Content-type: text/html\n\n")
#
print ("*** OK ***<p />")
# -------------------------------------------------------------------------
