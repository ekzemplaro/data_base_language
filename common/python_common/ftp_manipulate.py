# -*- coding: utf-8 -*-
#
#	ftp_manipulate.py
#
#					Jan/23/2012
#
import os
import sys
from ftplib import FTP
#
from file_io import file_to_str_proc
#
# ----------------------------------------------------------------
def ftp_read_proc (host,user,passwd,path):
#
	tmp_json = '/tmp/tmp_0052.json'
	ftp = FTP(host)
	ftp.login(user,passwd)
#	ftp.cwd("city")
	ftp.retrlines("retr " + path,open(tmp_json, 'wb').write)
	ftp.close()
#
	json_str = file_to_str_proc (tmp_json)
#
	os.unlink (tmp_json)
#
	return	json_str
# ----------------------------------------------------------------
