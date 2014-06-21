#! /usr/bin/python
#
#	riak_python_update.py
#
#					Dec/10/2013
#
# ------------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	os
import httplib2
import	datetime
import xml.dom.minidom
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
http_client = httplib2.Http ()
url_base = 'http://localhost:8098/riak/shimane'
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
	print "*** check couch pppp ***\n"
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
#
	url_target = url_base + '/' + id_in
	resp, content = http_client.request(url_target, "GET")
	city = json.loads (content)
	city['population'] = population_in
	city['date_mod'] = '%s' % datetime.date.today ()
	out_json = json.dumps (city)
	resp, content = http_client.request(url_target,"PUT",headers={'content-type':'application/json'},body=out_json)
print resp
#
#
#
print "OK<br />"
#
