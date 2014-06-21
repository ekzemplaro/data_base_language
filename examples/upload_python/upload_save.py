#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	upload_save.py
#
#					Feb/07/2014
#
# --------------------------------------------------------------------
import cgi
import cgitb; cgitb.enable()
import os, sys

# --------------------------------------------------------------------
def single_upload_file_proc (upload_dir,item):
	filename = item.filename
	path = os.path.join (upload_dir,os.path.basename(filename))
	chunk = item.file.read (100000)
	if chunk:
		fout = file (path, 'wb')
		fout.write (chunk)
		print filename + "<br />"
		fout.close()
		os.chmod (path, 0666)
# --------------------------------------------------------------------
def save_uploaded_file (upload_dir,fileitem):
#
	for item in fileitem:
		single_upload_file_proc (upload_dir,item)
#
# --------------------------------------------------------------------
upload_dir = "/tmp"
#
print "Content-Type: text/html"
print

form = cgi.FieldStorage()
if form.has_key("files"):
	fileitem = form["files"]
	print isinstance (fileitem,list)
	print "<br />"
	if (isinstance (fileitem,list)):
		save_uploaded_file (upload_dir,fileitem)
	else:
		single_upload_file_proc (upload_dir,fileitem)
else:
	print "*** Select files ***<br />"

print "*** end ***<br />"
#
# --------------------------------------------------------------------
