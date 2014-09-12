#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	jquery_upload_python/jquery_upload.py
#
#					Aug/27/2014
#
# --------------------------------------------------------------------
import	os
import	sys
import	json
import	cgi
# --------------------------------------------------------------------
from upload_file import upload_file_proc
# --------------------------------------------------------------------
#
message = []
message.append ("*** start *** jquery_upload.py ***")
form = cgi.FieldStorage()
#
message.append (str (form["username"]))
message.append (str (form["accountnum"]))
message.append (str (form["upload_dir"]))
#
message.append (str (form["username"].value))
message.append (str (form["accountnum"].value))
message.append (str (form["upload_dir"].value))
upload_dir = form["upload_dir"].value
message.append ("upload_dir = " + upload_dir)
#
if "file" in form:
	item = form["file"]
	try:
		message_aa = upload_file_proc (upload_dir,item)
		message.extend (message_aa)
	except Exception as ee:
		message.append ("*** error *** upload_file_proc ***")
		message.append (str (ee))
else:
	message.append ("*** Select files ***")
#
message.append ("*** end ***")
rvalue = {}
rvalue["message"] = message
out_str = json.dumps (rvalue)
#
print ("Content-Type: application/json")
print ("")
#
print (out_str)
# --------------------------------------------------------------------
