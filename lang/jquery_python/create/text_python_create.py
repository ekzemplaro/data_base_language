#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	text_python_create.py
#
#						Nov/26/2014
# -------------------------------------------------------------------------
import	sys
import	json
import	os
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import text_write_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2381','名古屋',93500,'2003-7-18')
	dict_aa = dict_append_proc (dict_aa,'t2382','豊橋',31200,'2003-4-10')
	dict_aa = dict_append_proc (dict_aa,'t2383','岡崎',28400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2384','一宮',62500,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t2385','蒲郡',42600,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2386','常滑',35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2387','大府',85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t2388','瀬戸',28100,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t2389','犬山',75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
file_out = "/var/tmp/plain_text/cities.txt"
#
dict_aa = data_prepare_proc ()
#
if os.path.isfile(file_out):
	os.remove (file_out)
#
text_write_proc (file_out,dict_aa);
os.chmod (file_out,0o666)
#
print ("Content-type: text/html\n\n")
#
print ("*** OK ***<p />")
# -------------------------------------------------------------------------
