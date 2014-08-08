#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	ftp_python_update.py
#
#					Aug/04/2014
#
# ------------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	os
import	pycurl
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_update_proc
from curl_get import curl_get_proc
from curl_get import file_upload_proc
from file_io	import file_write_proc
from cgi_manipulate import parse_parameter
#
# ------------------------------------------------------------------
url_json = 'ftp://scott:tiger@host_dbase/city/iwate.json'
os.environ["ftp_proxy"]=''
str_buf_aa = curl_get_proc (url_json)
dict_aa = json.loads (str (str_buf_aa,'UTF-8'))
#
# ------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("id_in = %s<br />" % id_in)
	print ("population_in = %d<br />" % population_in)
	dict_update_proc (dict_aa,id_in,population_in)
#
work_file="/tmp/cities_tmp04872.json"
out_str = json.dumps (dict_aa)
#
print ("*** check couch rrrrr ***\n")
#
file_write_proc (work_file,out_str)
file_upload_proc (url_json,work_file)
#
os.remove (work_file)
#
print ("OK<br />")
#
# ---------------------------------------------------------------
