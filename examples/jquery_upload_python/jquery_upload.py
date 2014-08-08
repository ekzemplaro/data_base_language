#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	jquery_upload.py
#
#					Aug/06/2014
#
# --------------------------------------------------------------------
import	os
import	sys
import	json
import	cgi
# --------------------------------------------------------------------
from upload_file import upload_file_proc
# --------------------------------------------------------------------
upload_dir = "./data_work"
#
print ("Content-Type: application/json")
print ("")
#
message = []
message.append ("*** start *** aaa ***")
message.append (upload_dir)
form = cgi.FieldStorage()
#
if "file" in form:
	item = form["file"]
	message_aa = upload_file_proc (upload_dir,item)
	message.extend (message_aa)
else:
	message.append ("*** Select files ***")
#
message.append ("*** end ***")
rvalue = {}
rvalue["message"] = message
out_str = json.dumps (rvalue)
#
print (out_str)
# --------------------------------------------------------------------
