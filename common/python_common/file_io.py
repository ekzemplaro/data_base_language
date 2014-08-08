# -*- coding: utf-8 -*-
#
#	file_io.py
#
#					Aug/05/2014
#
#
import	sys
import	string
#
# --------------------------------------------------------------------
def	file_to_str_proc (file_in):
	fp_in = open (file_in,encoding='utf-8')
	lines = fp_in.readlines ()
	str_out = ""
	for line in lines:
		str_out += line
#
	fp_in.close ()
#
	return	str_out
# --------------------------------------------------------------------
def file_write_proc (file_name,str_out):
#
	fp_out = open (file_name,mode='w',encoding='utf-8')
	fp_out.write (str_out)
	fp_out.close ()
#
# --------------------------------------------------------------------
