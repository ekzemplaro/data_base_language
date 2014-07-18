# -*- coding: utf-8 -*-
#
#	upload_file.py
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
def single_upload_file_proc (upload_dir,item):
	message = []
	filename = item.filename
	message.append (filename)
	path = os.path.join (upload_dir,os.path.basename(filename))
	chunk = item.file.read (100000)
	if chunk:
		fout = file (path, 'wb')
		fout.write (chunk)
#		print filename + "<br />"
		fout.close()
		os.chmod (path, 0666)
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
