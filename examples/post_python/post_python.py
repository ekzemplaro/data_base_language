#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
# ------------------------------------------------------------------
#	post_python.py
#
#						Aug/06/2014
#
# ------------------------------------------------------------------
import	cgi
import	os
import	sys
import	string
import	json
#
# ------------------------------------------------------------------
message = []
#
message.append ('*** post_python.py *** Aug/06/2014 start ***')
#
print ("Content-Type: application/json\n\n")
#
fname_in = ""
fname_out = ""
#
form = cgi.FieldStorage()
#
if "data_aa" in form:
	message.append ("*** data_aa exist ***")
	fname_in = form["data_aa"].value
	message.append (fname_in)
#
if "data_bb" in form:
	message.append ("*** data_bb exist ***")
	fname_out = form["data_bb"].value
	message.append (fname_out)
#
message.append ('*** post_python.py *** end ***')
#
result = {}
result['message'] = message
result['fname_in'] = fname_in
result['fname_out'] = fname_out
str_json = json.dumps (result)
print	(str_json)
#
# ------------------------------------------------------------------
