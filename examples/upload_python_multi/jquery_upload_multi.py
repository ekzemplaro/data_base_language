#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	upload_python_multi/jquery_upload_multi.py
#
#					Nov/20/2015
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
array_fname = ["file_aa","file_bb","file_cc","file_dd","file_ee", \
	"file_ff","file_gg","file_hh","file_ii","file_jj"]
for fname in array_fname:
	if fname in form:
		message += file_process (fname,form)
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
