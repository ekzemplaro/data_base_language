#! /usr/bin/python
#
#	couch_python_update.py
#
#					Jun/19/2014
#
# ------------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	os
#import xml.dom.minidom
import pycurl
import datetime
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
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	key_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "key_in = %s<br />" % key_in
	print "population_in = %d<br />" % population_in
	url_key = url_json + '/' + key_in
	str_buf_aa = curl_get_proc (url_key)
#
	print (str_buf_aa)
	unit_aa = json.loads (str_buf_aa)
	name = unit_aa['name'].encode ('utf-8')
	unit_aa['name'] = name
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = '%s' % datetime.date.today ()
	out_str = json.dumps (unit_aa)
	print (url_key)
	print (out_str)
#
	try:
		curl_put_proc (url_key,out_str)
	except:
		print "Unexpected error:", sys.exc_info()[0]
#
print "OK<br />"
#
