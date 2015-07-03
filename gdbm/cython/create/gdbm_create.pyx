# -*- coding: utf-8 -*-
#
#	gdbm_create.pyx
#
#					Jul/03/2015
# -------------------------------------------------------------
import	os
import	sys
import	string
import	dbm
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
# -------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2151','岐阜',52176,'1949-4-21')
	dict_aa = dict_append_proc (dict_aa,'t2152','大垣',48235,'1949-3-15')
	dict_aa = dict_append_proc (dict_aa,'t2153','多治見',23674,'1949-8-14')
	dict_aa = dict_append_proc (dict_aa,'t2154','各務原',89612,'1949-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2155','土岐',45391,'1949-10-4')
	dict_aa = dict_append_proc (dict_aa,'t2156','高山',36187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2157','美濃加茂',91246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2158','恵那',23784,'1949-11-26')
	dict_aa = dict_append_proc (dict_aa,'t2159','関',75823,'1949-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------
print ("*** 開始 ***")
#
db_name = sys.argv[1]
print (db_name)
#
if os.path.exists (db_name):
	os.remove (db_name)
#
dict_aa = data_prepare_proc ()
#
dd = dbm.open (db_name,"c")
#
for key in sorted (dict_aa.keys()):
	value = dict_aa[key]
	json_str = json.dumps (value)
	dd[key] = json_str
#
#
dd.close ()
os.chmod (db_name,0666)
#
print ("*** 終了 ***")
# -------------------------------------------------------------
