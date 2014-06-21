#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	jython_file_io.py
#
#				Jun/20/2012
#
#
import	sys
import	string
#
from java.lang import	System
from java.lang import	String
from java.io import	File,FileWriter,BufferedWriter,PrintWriter
# --------------------------------------------------------------------
def	file_to_str_proc (file_in):
	fp_in = open (file_in,"r")
	lines = fp_in.readlines ()
	json_str = ""
	for line in lines:
		json_str += line
#
	return	json_str
#
# --------------------------------------------------------------------
def file_write_proc (file_name,str_out):
#
	fp_file = File (file_name)
	filewriter = FileWriter (fp_file)
	bufw = BufferedWriter (filewriter)
#
	prw = PrintWriter (bufw)
#
#	pw.print (String (str_out,"utf-8"))
	prw.print (str_out)
	prw.close ()
#
# --------------------------------------------------------------------
