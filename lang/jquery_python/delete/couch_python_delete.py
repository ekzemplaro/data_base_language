#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	couch_python_delete.py
#
#					Aug/04/2014
#
# ------------------------------------------------------------------
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
from curl_get import curl_get_proc
from curl_get import curl_delete_proc
#
from cgi_manipulate import parse_parameter
# ------------------------------------------------------------------
url_json = 'http://localhost:5984/nagano'
os.environ["http_proxy"]=''
#
# ------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	key_in = array_bb[it]
	print ("key_in = %s<br />" % key_in)
	url_key = url_json + '/' + key_in
	str_buf_aa = curl_get_proc (url_key)
	unit_aa = json.loads (str (str_buf_aa,'UTF-8'))
	if ('_rev' in unit_aa):
		print (unit_aa['_rev'])
		url_del = url_key + '?rev=' + unit_aa['_rev']
		curl_delete_proc (url_del)
#
print ("*** OK ***<br />")
#
# ---------------------------------------------------------------
