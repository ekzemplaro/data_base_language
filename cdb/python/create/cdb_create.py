#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	cdb_create.py
#
#					Mar/26/2013
#
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from cdb_manipulate import cdb_write_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t2761',u'豊中'.encode ('utf-8'),76128,'2003-8-20')
	dict_aa = dict_append_proc (dict_aa,'t2762',u'池田'.encode ('utf-8'),23591,'2003-2-30')
	dict_aa = dict_append_proc (dict_aa,'t2763',u'高槻'.encode ('utf-8'),65438,'2003-7-24')
	dict_aa = dict_append_proc (dict_aa,'t2764',u'吹田'.encode ('utf-8'),83672,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t2765',u'茨木'.encode ('utf-8'),42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t2766',u'摂津'.encode ('utf-8'),35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2767',u'泉大津'.encode ('utf-8'),81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2768',u'和泉'.encode ('utf-8'),24785,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2769',u'高石'.encode ('utf-8'),75823,'2003-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
file_cdb = sys.argv[1]
print (file_cdb)
#
dict_aa = data_prepare_proc ()
#
cdb_write_proc (file_cdb,dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
