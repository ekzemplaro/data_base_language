#! /usr/bin/python
# -*- coding: utf-8 -*-
#
# ------------------------------------------------------------------
#	post_python.py
#
#						Feb/10/2014
#
# ------------------------------------------------------------------
import	cgi
import	os
import	sys
import	string
import	random
import	socket
import	json
#
# ------------------------------------------------------------------
message = []
#
message.append ('*** post_python.py *** start ***')
#
print "Content-Type: application/json\n\n"
#
fname_in = ""
fname_out = ""
#
form = cgi.FieldStorage()
if form.has_key("data_aa"):
	message.append ("*** data_aa exist ***")
	fname_in = form["data_aa"].value
	message.append (fname_in)
#
if form.has_key("data_bb"):
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
print	str_json

# ------------------------------------------------------------------
