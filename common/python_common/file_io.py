# -*- coding: utf-8 -*-
#
#	python_common/file_io.py
#
#					Feb/17/2018
#
# --------------------------------------------------------------------
import	sys
import	string
import	fcntl
#
# --------------------------------------------------------------------
def file_to_str_proc(file_in):
	str_out = ""
	try:
		fp_in = open(file_in,encoding='utf-8')
		str_out = fp_in.read()
		fp_in.close()
	except Exception as ee:
		sys.stderr.write("*** error *** file_to_str_proc ***\n")
		sys.stderr.write(str (ee))
#
	return	str_out
# --------------------------------------------------------------------
def file_write_proc(file_name,str_out):
#
	fp_out = open(file_name,mode='w',encoding='utf-8')
	fcntl.lockf(fp_out, fcntl.LOCK_EX)
	fp_out.write(str_out)
	fp_out.close()
#
# --------------------------------------------------------------------
