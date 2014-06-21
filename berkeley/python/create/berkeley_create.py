#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_create.db
#
#						Oct/12/2011
# -----------------------------------------------------------------
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from text_manipulate import dict_display_proc
# -----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2451',u'津'.encode ('utf-8'),59176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t2452',u'鈴鹿'.encode ('utf-8'),47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t2453',u'伊勢'.encode ('utf-8'),21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2454',u'鳥羽'.encode ('utf-8'),83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2455',u'四日市'.encode ('utf-8'),42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2456',u'亀山'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2457',u'尾鷲'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2458',u'桑名'.encode ('utf-8'),29784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2459',u'志摩'.encode ('utf-8'),75823,'2003-12-15')
	dict_aa = dict_append_proc (dict_aa,'t2460',u'伊賀'.encode ('utf-8'),23916,'2003-5-8')
	dict_aa = dict_append_proc (dict_aa,'t2461',u'名張'.encode ('utf-8'),16578,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2462',u'熊野'.encode ('utf-8'),82345,'2003-7-24')
#
	return	dict_aa
#
# -----------------------------------------------------------------
import	os
import	sys
from bsddb import db
#
print ("*** 開始 ***\n")
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
print db.DB_VERSION_STRING + "\n"
#
db_name = sys.argv[1]
if os.path.exists (db_name):
	os.remove (db_name)
#
adb = db.DB ()
adb.open (db_name,dbtype=db.DB_HASH,flags=db.DB_CREATE)
#
for key in dict_aa.keys():
	unit_aa = dict_aa[key]
	json_str = json.dumps (unit_aa)
	
	adb[key]=json_str
#
adb.close ()
#
os.chmod (db_name,0777)
print ("*** 終了 ***\n")
# -----------------------------------------------------------------
