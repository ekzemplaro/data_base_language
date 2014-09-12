#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	jquery_upload_multi.py
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
def file_process (file_key,form):
	message = []
	item = form[file_key]
	try:
		message_aa = upload_file_proc (upload_dir,item)
		message.extend (message_aa)
	except Exception as ee:
		message.append ("*** error *** from upload_file_proc ***")
		message.append (str (ee))
#
	return	message

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
if "file_aa" in form:
	message += file_process ("file_aa",form)
if "file_bb" in form:
	message += file_process ("file_bb",form)
#
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
