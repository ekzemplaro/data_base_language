# -*- coding: utf-8 -*-
#
#	upload_file.py
#
#					Aug/07/2014
#
# --------------------------------------------------------------------
import	cgi
import	cgitb
#; cgitb.enable()
import	os
import	sys
import	json
# --------------------------------------------------------------------
def single_upload_file_proc (upload_dir,item):
	message = []
	file_in = item.filename
	message.append (file_in)
	path = os.path.join (upload_dir,os.path.basename (file_in))
	chunk = item.file.read ()
	if chunk:
		fout = open (path, 'wb')
		fout.write (chunk)
		fout.close()
		os.chmod (path, 0o666)
	return message
# --------------------------------------------------------------------
def multi_uploaded_file (upload_dir,fileitem):
	message = []
#
	for item in fileitem:
		message_s = single_upload_file_proc (upload_dir,item)
		message.extend (message_s)
#
	return message
#
# --------------------------------------------------------------------
def upload_file_proc (upload_dir,fileitem):
	message = []
#
	if (isinstance (fileitem,list)):
		message.append ("*** save_uploaded_file ***")
		message_aa = multi_uploaded_file (upload_dir,fileitem)
		message.extend (message_aa)
	else:
		message.append ("*** single_upload_file_proc ***")
		message_aa = single_upload_file_proc (upload_dir,fileitem)
		message.extend (message_aa)
#
	return	message
# --------------------------------------------------------------------
