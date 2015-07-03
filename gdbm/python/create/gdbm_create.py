#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	gdbm_create.py
#
#					Jun/11/2015
# -------------------------------------------------------------
import	os
import	sys
import	string
import	json
import	dbm
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dbm_disp_proc,dict_to_dbm_proc
from text_manipulate import dict_append_proc
# -------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2151','岐阜',72361,'2003-12-21')
	dict_aa = dict_append_proc (dict_aa,'t2152','大垣',25764,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2153','多治見',21659,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2154','各務原',83672,'2003-3-9')
	dict_aa = dict_append_proc (dict_aa,'t2155','土岐',42395,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2156','高山',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2157','美濃加茂',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2158','恵那',24783,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2159','関',75829,'2003-12-15')
	dict_aa = dict_append_proc (dict_aa,'t2160','中津川',27451,'2003-2-8')
#
	return	dict_aa
#
# -------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
db_name = sys.argv[1]
if os.path.exists (db_name):
	os.remove (db_name)
#
dd = dbm.open (db_name,"c")
#
dict_to_dbm_proc (dd,dict_aa)
#
dbm_disp_proc (dd)
#
dd.close ()
os.chmod (db_name,0o666)
#
print ("*** 終了 ***")
# -------------------------------------------------------------
