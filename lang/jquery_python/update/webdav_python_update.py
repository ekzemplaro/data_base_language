#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	webdav_python_update.py
#
#					Aug/04/2014
#
# ------------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	os
import pycurl
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_update_proc
from curl_get import curl_get_proc
from curl_get import curl_put_proc
from cgi_manipulate import parse_parameter
#
# ------------------------------------------------------------------
url_json = 'http://host_dbase:3004/city/tokyo.json'
os.environ["http_proxy"]=''
str_buf_aa = curl_get_proc (url_json)
dict_aa = json.loads (str (str_buf_aa,'UTF-8'))
#
# ------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
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
out_str = json.dumps (dict_aa)
#
print ("*** check couch rrrrr ***\n")
print	(out_str)
#
curl_put_proc (url_json,out_str)
#
print ("OK<br />")
#
# ------------------------------------------------------------------
