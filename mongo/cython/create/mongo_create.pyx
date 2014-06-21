# -*- coding: utf-8 -*-
#
#	mongo_create.pyx
#
#					Jun/25/2012
#
# -------------------------------------------------------------
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
import pymongo
# -------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1161',u'さいたま'.encode ('utf-8'),54176,'1949-4-30')
	dict_aa = dict_append_proc (dict_aa,'t1162',u'所沢'.encode ('utf-8'),47235,'1949-5-10')
	dict_aa = dict_append_proc (dict_aa,'t1163',u'越谷'.encode ('utf-8'),21759,'1949-6-14')
	dict_aa = dict_append_proc (dict_aa,'t1164',u'久喜'.encode ('utf-8'),83672,'1949-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1165',u'熊谷'.encode ('utf-8'),42391,'1949-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1166',u'秩父'.encode ('utf-8'),35187,'1949-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1167',u'川越'.encode ('utf-8'),81246,'1949-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1168',u'和光'.encode ('utf-8'),23784,'1949-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1169',u'新座'.encode ('utf-8'),75823,'1949-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
connection = pymongo.Connection("localhost", 27017)
db = connection.city_db
#db.name ()
#
db.saitama
db.saitama.remove ()
#
for key in dict_aa.keys():
	unit = dict_aa[key]
	db.saitama.save({"id": key,"name": unit['name'],"population": unit['population'],"date_mod": unit['date_mod']})
#
print ("*** 終了 ***")
# -------------------------------------------------------------
