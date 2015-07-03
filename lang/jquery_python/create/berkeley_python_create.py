#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	berkeley_python_create.py
#
#						Jun/24/2015
# -------------------------------------------------------------------------
import	os
import	sys
from bsddb3 import db
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2451','津',53600,'2003-8-24')
	dict_aa = dict_append_proc (dict_aa,'t2452','鈴鹿',21500,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t2453','伊勢',75400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2454','鳥羽',83900,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2455','四日市',48100,'2003-7-4')
	dict_aa = dict_append_proc (dict_aa,'t2456','亀山',35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2457','尾鷲',27600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2458','桑名',93400,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2459','志摩',58300,'2003-12-15')
	dict_aa = dict_append_proc (dict_aa,'t2460','伊賀',29600,'2003-5-8')
	dict_aa = dict_append_proc (dict_aa,'t2461','名張',57100,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2462','熊野',82500,'2003-7-24')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
db_name = "/var/tmp/berkeley/cities.db"
#
#if os.path.exists (db_name):
#	os.remove (db_name)
#
adb = db.DB ()
# adb.open (db_name,dbtype=db.DB_HASH,flags=db.DB_CREATE)
adb.open (db_name,dbtype=db.DB_BTREE,flags=db.DB_CREATE)
#
#
for key in dict_aa.keys():
	unit_aa = dict_aa[key]
	json_str = json.dumps (unit_aa)
#	
	adb[bytes(key,'utf-8')]=json_str
#
#
adb.close ()
#
#os.chmod (db_name,0o666)
#
print ("Content-type: text/html\n\n")
#
print	("*** OK ***<p />")
# -------------------------------------------------------------------------
