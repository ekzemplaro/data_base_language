#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	upload_python_multi/jquery_upload_multi.py
#
#					Jul/29/2017
#
# --------------------------------------------------------------------
import	sys
import	json
import	cgi
# --------------------------------------------------------------------
from upload_file import single_upload_file_proc
# --------------------------------------------------------------------
message = []
message.append ("*** start *** jquery_upload_multi.py ***")
form = cgi.FieldStorage()
#
message.append (str (form["upload_dir"]))
#
upload_dir = form["upload_dir"].value
message.append ("upload_dir = " + upload_dir)
#
count = 0
for key in form:
	if (key != "upload_dir"):
#		message.append ("count = %d" % count)
#		message.append ("key = " + key)
		item = form[key]
		message += single_upload_file_proc (upload_dir,item)
#
		count += 1
#
message.append ("*** end *** jquery_upload_multi.py ***")
rvalue = {}
rvalue["message"] = message
out_str = json.dumps (rvalue)
#
print ("Content-Type: application/json")
print ("")
#
print (out_str)
# --------------------------------------------------------------------
