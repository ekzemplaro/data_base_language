#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	count_up.py
#
#						Jun/01/2015
#
#
# ---------------------------------------------------------------------
import	sys
import	json
import	cgi
#
sys.path.append ('/var/www/data_base/common/python_common')
from file_io import file_to_str_proc
from file_io import file_write_proc
# ---------------------------------------------------------------------
#
message = []
#
message.append ('*** count_up.py *** start ***')
#
form = cgi.FieldStorage()
message.append ('*** bbbb ***')
#
for key in form.keys():
	message.append (key)
	message.append (form[key].value)
#
if "host" in form:
	message.append ("host = " + form["host"].value)
#
if "date" in form:
	message.append ("date = " + form["date"].value)
#
if "key" in form:
	message.append ("key = " + form["key"].value)
#
#
file_in = "/var/tmp/count_up/count.txt"
#
str_in = file_to_str_proc (file_in)

nn = int (str_in)
nn += 1
str_out = "%d\n" % nn
file_write_proc (file_in,str_out)

message.append ("%d" % nn)
message.append ('*** count_up.py *** end ***')
#
result = {}
result['message'] = message
result['str_in'] = str_in
result['str_out'] = str_out
#
str_aa = json.dumps (result)
print ("Content-type: text/json; charset=UTF-8\n\n")
print (str_aa)
#
# ---------------------------------------------------------------------
