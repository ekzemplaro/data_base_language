#! /usr/bin/python  
# -*- coding: utf-8 -*-
#
#	tcbn_create.py
#
#					Jun/27/2012
#
import	sys
import	json
import	pytc
import	os
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from dbm_manipulate import dict_to_dbm_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0831',u'水戸'.encode ('utf-8'),96176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t0832',u'古河'.encode ('utf-8'),47235,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0833',u'結城'.encode ('utf-8'),21654,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0834',u'土浦'.encode ('utf-8'),83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0835',u'牛久'.encode ('utf-8'),42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0836',u'取手'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0837',u'つくば'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0838',u'日立'.encode ('utf-8'),24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0839',u'守谷'.encode ('utf-8'),75823,'2003-12-15')
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
if os.path.exists (file_tcbn):
	os.remove (file_tcbn)
#
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
#
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
dict_to_dbm_proc (db,dict_aa)
#
db.close ()
os.chmod (file_tcbn,0666)
#
print	("*** 終了 ***")
# -------------------------------------------------------------------------
