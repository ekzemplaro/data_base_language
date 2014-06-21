#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	ftp_create.py
#
#					Feb/25/2013
#
# -------------------------------------------------------------
from ftplib import FTP
import	sys
import	os
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from text_manipulate import dict_display_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_file_io import file_to_str_proc
from jython_file_io import file_write_proc
from jython_ftp_manipulate import ftp_put_proc
#
# -------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0361','盛岡',39176,'2004-9-21')
	dict_aa = dict_append_proc (dict_aa,'t0362','久慈',17825,'2004-2-12')
	dict_aa = dict_append_proc (dict_aa,'t0363','二戸',72654,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t0364','宮古',69452,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0365','遠野',47351,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0366','八幡平',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0367','大船渡',81256,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0368','一関',24781,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0369','花巻',82394,'2004-12-15')
#
	return	dict_aa
#
# -------------------------------------------------------------
print	("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
dict_display_proc (dict_aa)
json_str = json.dumps (dict_aa)
#
ftp_put_proc ('host_dbase','scott','tiger','city/iwate.json',json_str)
#
print	("*** 終了 ***")
# -------------------------------------------------------------
