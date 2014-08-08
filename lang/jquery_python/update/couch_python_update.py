#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	couch_python_update.py
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
import	datetime
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from curl_get import curl_get_proc
from curl_get import curl_put_proc
from cgi_manipulate import parse_parameter
#
# ------------------------------------------------------------------
url_json = 'http://localhost:5984/nagano'
os.environ["http_proxy"]=''
#
# ------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
array_bb = parse_parameter ()
#
print ("*** ccc ***<br />")
for it in range (len(array_bb)):
	key_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("key_in = %s<br />" % key_in)
	print ("population_in = %d<br />" % population_in)
	url_key = url_json + '/' + key_in
	str_buf_aa = curl_get_proc (url_key)
#
	print (str_buf_aa)
	unit_aa = json.loads (str (str_buf_aa,'UTF-8'))
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = '%s' % datetime.date.today ()
	out_str = json.dumps (unit_aa)
	print (url_key)
	print (out_str)
#
	print ("*** ppp ***<br />")
	try:
		print ("*** qqq ***<br />")
		curl_put_proc (url_key,out_str)
	except:
		print ("Unexpected error:", sys.exc_info()[0])
#
print ("OK<br />")
#
# ---------------------------------------------------------------
