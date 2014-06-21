#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	cdb_python_create.py
#
#						Mar/26/2013
# -------------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from cdb_manipulate import cdb_write_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2761',u'豊中'.encode ('utf-8'),61500,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t2762',u'池田'.encode ('utf-8'),23500,'2003-4-24')
	dict_aa = dict_append_proc (dict_aa,'t2763',u'高槻'.encode ('utf-8'),65400,'2003-9-4')
	dict_aa = dict_append_proc (dict_aa,'t2764',u'吹田'.encode ('utf-8'),83600,'2003-10-8')
	dict_aa = dict_append_proc (dict_aa,'t2765',u'茨木'.encode ('utf-8'),42300,'2003-8-7')
	dict_aa = dict_append_proc (dict_aa,'t2766',u'摂津'.encode ('utf-8'),35100,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t2767',u'泉大津'.encode ('utf-8'),81600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t2768',u'和泉'.encode ('utf-8'),24700,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t2769',u'高石'.encode ('utf-8'),75800,'2003-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
file_cdb = "/var/tmp/cdb/cities.cdb"
#
dict_aa = data_prepare_proc ()
#
cdb_write_proc (file_cdb,dict_aa);
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
