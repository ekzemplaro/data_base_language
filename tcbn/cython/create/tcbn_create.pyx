#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	tcbn_create.py
#
#					Dec/27/2011
#
import	sys
import	json
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_write_proc
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0831',u'水戸'.encode ('utf-8'),76176,'1925-4-30')
	dict_aa = dict_append_proc (dict_aa,'t0832',u'古河'.encode ('utf-8'),17235,'1925-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0833',u'結城'.encode ('utf-8'),21654,'1925-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0834',u'土浦'.encode ('utf-8'),83672,'1925-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0835',u'牛久'.encode ('utf-8'),42391,'1925-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0836',u'取手'.encode ('utf-8'),35187,'1925-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0837',u'つくば'.encode ('utf-8'),81246,'1925-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0838',u'日立'.encode ('utf-8'),54784,'1925-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0839',u'守谷'.encode ('utf-8'),65823,'1925-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print	("*** 開始 ***")
#
file_tcbn = sys.argv[1]
#
print	file_tcbn
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
for key in dict_aa.keys ():
	json_new = json.dumps (dict_aa[key])
	print key,json_new
	db[key] = json_new
db.close ()
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
