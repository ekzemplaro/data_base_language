#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pick_up_pyquery.py
#
#						Jun/26/2015
#
import	sys
import	json
#
from pyquery import PyQuery
#
# --------------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_write_proc
# --------------------------------------------------------------------
print ("*** 開始 ***")
file_in = sys.argv[1]
json_out = sys.argv[2]
#
doc = PyQuery(filename=file_in)
#
title = doc('title').text()
print (title)
table = doc('table').text()
# print (table)

array_out = []
for tr in doc('tr').items():
#	print (tr.text ())
	array_record = []
	for td in tr('td').items():
		data = td.text ()
		array_record.append (data)
#
	array_out.append (array_record)
#
out_str = json.dumps (array_out)
file_write_proc (json_out,out_str)
print ("*** 終了 ***")
# --------------------------------------------------------------------
#
