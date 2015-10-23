#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tcbn_read.py
#
#						Dec/21/2011
#
import	sys
import	json
import	string
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
file_tcbn = sys.argv[1]
#
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
dict_aa = {}
for key in db:
#	print 'key:', key, ' value:', db[key]
	array_aa = json.loads (db[key])
	name_aa = array_aa['name'].encode ('utf-8')
	dict_unit = {'name': name_aa, \
			'population':array_aa['population'], \
			'date_mod':array_aa['date_mod']}
	dict_aa[key] = dict_unit
#
dict_display_proc (dict_aa)
print ("*** 終了 ***")
#
# ------------------------------------------------------------
