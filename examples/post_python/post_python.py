#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	post_python/post_python.py
#
#						Apr/16/2016
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
message.append ('*** post_python.py *** Apr/16/2016 start ***')
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
if "parm_str" in form:
	message.append ("*** parm_str exist ***")
	parm_str = form["parm_str"].value
	message.append (parm_str)
	parm_array = json.loads (parm_str)
	message.append ("len (parm_array) = %d" % len (parm_array))
	for it in range (len (parm_array)): 
		message.append ("%d" % it)
		message.append ("parm_array[%d] = %s" % (it,parm_array[it]))
else:
	message.append ("*** parm_str not exist ***")
#
message.append ('*** post_python.py *** end ***')
#
result = {}
result['message'] = message
result['fname_in'] = fname_in
result['fname_out'] = fname_out
str_json = json.dumps (result)
#
print ("Content-Type: application/json\n\n")
#
#
print	(str_json)
#
# ------------------------------------------------------------------
