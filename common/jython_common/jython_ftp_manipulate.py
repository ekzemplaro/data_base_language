#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#	jython_ftp_manipulate.py
#
#					Sep/25/2011
#
#
from ftplib import FTP
import	sys
import	os
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_file_io import file_to_str_proc
from jython_file_io import file_write_proc
#
# --------------------------------------------------------------------
def	ftp_get_proc (server,user,passwd,path):
	ftp = FTP(server)
	ftp.login(user,passwd)
	file_tmp="/tmp/tmp005382.txt"
	fp_out = open(file_tmp, 'wb')
#
	ftp.retrbinary('RETR '+path, fp_out.write)
	ftp.quit ()
	fp_out.close ()
	str_in = file_to_str_proc (file_tmp)
#
	os.remove (file_tmp)

	return	str_in
#
# --------------------------------------------------------------------
def	ftp_put_proc (server,user,passwd,path,str_in):
	file_tmp="/tmp/tmp003389.txt"
	file_write_proc (file_tmp,str_in)
#
	ftp = FTP(server)
	ftp.login(user,passwd)
#
	fp_in = open (file_tmp)
	ftp.storlines('STOR ' + path,fp_in)
	ftp.quit ()
	fp_in.close ()
#
	os.remove (file_tmp)
#
# --------------------------------------------------------------------
