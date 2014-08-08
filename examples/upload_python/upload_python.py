#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	upload_python/upload_python.py
#
#					Aug/06/2014
#
# --------------------------------------------------------------------
import os
import sys
import cgi
#
# --------------------------------------------------------------------
def single_upload_file_proc (upload_dir,item):
	filename = item.filename
	try:
		path = os.path.join (upload_dir,os.path.basename(filename))
		chunk = item.file.read (500000)
		if chunk:
			fout = open (path,mode='w', encoding='utf-8')
#			fout = open (path,'w')
			fout.write (str (chunk,'UTF-8'))
			print (filename + "<br />")
			fout.close()
			os.chmod (path, 0o666)
	except Exception as ee:
		print ("*** error ***<br />")
		print (str (ee))
# --------------------------------------------------------------------
def save_uploaded_file (upload_dir,fileitem):
#
	for item in fileitem:
		single_upload_file_proc (upload_dir,item)
#
# --------------------------------------------------------------------
upload_dir = "/tmp"
#
print ("Content-Type: text/html")
print ("")

form = cgi.FieldStorage()
if "files" in form:
	fileitem = form["files"]
	print (isinstance (fileitem,list))
	print ("<br />")
	if (isinstance (fileitem,list)):
		save_uploaded_file (upload_dir,fileitem)
	else:
		single_upload_file_proc (upload_dir,fileitem)
else:
	print ("*** Select files ***<br />")

print ("*** end ***<br />")
#
# --------------------------------------------------------------------
