#! /usr/bin/python
#
#	riak_python_delete.py
#
#					Feb/09/2015
#
# ------------------------------------------------------------------
import	cgi
import	sys
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from cgi_manipulate import parse_parameter
from curl_get import curl_delete_proc
# ------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	key_in = array_bb[it]
	url_target = url_base + '/' + key_in
	curl_delete_proc (url_target)
#
print ("*** OK ***<br />")
#
# ---------------------------------------------------------------
