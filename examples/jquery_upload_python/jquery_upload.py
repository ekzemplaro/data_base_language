#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	jquery_upload.py
#
#					Jul/16/2014
#
# --------------------------------------------------------------------
import	cgi
import	cgitb; cgitb.enable()
import	os
import	sys
import	json
# --------------------------------------------------------------------
from upload_file import upload_file_proc
# --------------------------------------------------------------------
upload_dir = "./data_work"
#
print "Content-Type: application/json"
print
#
message = []
message.append ("*** start *** aaa ***")
message.append (upload_dir)
form = cgi.FieldStorage()
#
if form.has_key("file"):
	fileitem = form["file"]
	message_aa = upload_file_proc (upload_dir,fileitem)
	message.extend (message_aa)
else:
	message.append ("*** Select files ***")
#
message.append ("*** end ***")
out_str = json.dumps (message)
#
print out_str
# --------------------------------------------------------------------
