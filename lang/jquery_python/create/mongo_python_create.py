#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	mongo_python_create.py
#
#						Sep/02/2013
# -------------------------------------------------------------------------
import	sys
import	json
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from mongo_manipulate import dict_to_mongo_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t1161',u'さいたま'.encode ('utf-8'),75600,'2003-5-12')
	dict_aa = dict_append_proc (dict_aa,'t1162',u'所沢'.encode ('utf-8'),47200,'2003-8-10')
	dict_aa = dict_append_proc (dict_aa,'t1163',u'越谷'.encode ('utf-8'),25400,'2003-2-14')
	dict_aa = dict_append_proc (dict_aa,'t1164',u'久喜'.encode ('utf-8'),62100,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t1165',u'熊谷'.encode ('utf-8'),49600,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1166',u'秩父'.encode ('utf-8'),35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1167',u'川越'.encode ('utf-8'),85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t1168',u'和光'.encode ('utf-8'),27800,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t1169',u'新座'.encode ('utf-8'),75300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
dict_to_mongo_proc (dict_aa)
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
