#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	tcbn_python_create.py
#
#						Jun/27/2012
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
import	pytc

sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dict_to_dbm_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t0831',u'水戸',91700,'2003-6-9')
	dict_aa = dict_append_proc (dict_aa,'t0832',u'古河',17200,'2003-9-10')
	dict_aa = dict_append_proc (dict_aa,'t0833',u'結城',65400,'2003-2-14')
	dict_aa = dict_append_proc (dict_aa,'t0834',u'土浦',62500,'2003-7-9')
	dict_aa = dict_append_proc (dict_aa,'t0835',u'牛久',42600,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0836',u'取手',35700,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0837',u'つくば',85600,'2003-10-23')
	dict_aa = dict_append_proc (dict_aa,'t0838',u'日立',28400,'2003-8-26')
	dict_aa = dict_append_proc (dict_aa,'t0839',u'守谷',95300,'2003-9-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
dict_aa = data_prepare_proc ()
#
file_tcbn = "/var/tmp/tokyo_cabinet/cities.tcb"
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
print	"*** check aaa  ***<p />"
dict_to_dbm_proc (db,dict_aa)
print	"*** check ccc  ***<p />"
#
db.close ()
#
#
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
