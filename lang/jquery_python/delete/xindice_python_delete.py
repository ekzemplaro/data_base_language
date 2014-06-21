#! /usr/bin/python
#
#	xindice_python_delete.py
#
#					Apr/13/2012
#
import	math
import	cgi
import	string
import	sys
import os
import xml.dom.minidom
import pycurl
#
import	json
# ------------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_delete_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
from curl_get import curl_get_proc
from curl_get import curl_put_proc
#
from cgi_manipulate import parse_parameter
# ------------------------------------------------------------------
url_base = 'http://host_dbase:8888/xindice/db/'
url_sub = 'cities/cities'
url_in = url_base + url_sub
#
str_aa = curl_get_proc (url_in)
dict_aa=xml_to_dict_proc (str_aa)
#
# ------------------------------------------------------------------
#
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
#
print "*** check pppp_qqqq ***<br />"
array_bb = parse_parameter ()
print "*** check ssss_qqqq ***<br />"
#
print "len(array_bb) = %d<br />" % len(array_bb)
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	dict_aa=dict_delete_proc (dict_aa,id_in)
	print "*** check rrrr ***<br />"
#
print "*** check ssss ***<br />"
out_str = dict_to_xml_proc (dict_aa)
print "*** check tttt ***<br />"
#
#
curl_put_proc (url_in,out_str.encode('utf-8'))
#
#
print "OK<br />"
#
# ---------------------------------------------------------------
