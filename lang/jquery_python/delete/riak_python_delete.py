#! /usr/bin/python
#
#	riak_python_delete.py
#
#					Dec/10/2013
#
# ------------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import httplib2
#
sys.path.append ('/var/www/data_base/common/python_common')
#
#
from cgi_manipulate import parse_parameter
# ------------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
#
http_client = httplib2.Http ()
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	print "*** check couch pppp ***\n"
	key_in = array_bb[it]
	print "key_in = %s<br />" % key_in
	url_target = 'http://localhost:8098/riak/shimane/' + key_in
	resp, content = http_client.request(url_target, "DELETE")
	print resp
#	curl_delete_proc (url_target)
#
print ("*** check couch rrrrr ***\n")
#
print "*** OK ***<br />"
#
