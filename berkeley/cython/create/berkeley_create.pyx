# -*- coding: utf-8 -*-
#
#	berkeley_create.pyx
#
#						Jun/03/2015
# -----------------------------------------------------------------
import	sys
import	json
import	os
from bsddb3 import db
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# -----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2451','津',76312,'1925-4-30')
	dict_aa = dict_append_proc (dict_aa,'t2452','鈴鹿',49235,'1925-5-10')
	dict_aa = dict_append_proc (dict_aa,'t2453','伊勢',21654,'1925-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2454','鳥羽',83672,'1925-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2455','四日市',42391,'1925-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2456','亀山',35187,'1925-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2457','尾鷲',81246,'1925-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2458','桑名',24784,'1925-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2459','志摩',75823,'1925-12-15')
	dict_aa = dict_append_proc (dict_aa,'t2460','伊賀',23916,'1925-5-8')
	dict_aa = dict_append_proc (dict_aa,'t2461','名張',19578,'1925-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2462','熊野',81345,'1925-7-24')
#
	return	dict_aa
#
# -----------------------------------------------------------------
#
print ("*** 開始 ***\n")
dict_aa = data_prepare_proc ()
print db.DB_VERSION_STRING + "\n"
#
db_name = sys.argv[1]
if os.path.exists (db_name):
	os.remove (db_name)
#
adb = db.DB ()
#adb.open (db_name,dbtype=db.DB_HASH,flags=db.DB_CREATE)
adb.open (db_name,dbtype=db.DB_BTREE,flags=db.DB_CREATE)
#
for key in dict_aa.keys():
	unit_aa = dict_aa[key]
	json_str = json.dumps (unit_aa)
	adb[bytes(key,'utf-8')]=json_str
#	adb[key]=json_str
#
adb.close ()
#
os.chmod (db_name,0777)
print ("*** 終了 ***\n")
# -----------------------------------------------------------------
