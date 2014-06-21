#! /usr/bin/python
#
#	exist_python_update.py
#
#					Apr/13/2012
#
import	math
import	cgi
import	string
import	sys
import os
import	urllib
import xml.dom.minidom
import pycurl
#
import	json
# ------------------------------------------------------------------
#
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_update_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
#from file_io import file_write_proc
from curl_get import curl_get_proc
from curl_get import curl_put_proc
#
from cgi_manipulate import parse_parameter
# ------------------------------------------------------------------
collections = 'cities'
xml_file = "cities.xml"

url = 'http://localhost:8086/exist/rest/db/' + collections + '/' + xml_file
#
str_aa = curl_get_proc (url)
dict_aa=xml_to_dict_proc (str_aa)
#
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
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
	dict_update_proc (dict_aa,id_in,population_in)
	print "*** check rrrr ***<br />"
#
out_str = dict_to_xml_proc (dict_aa)
print "*** check ssss ***<br />"
#work_file="/tmp/cities_tmp0908.xml"
#file_write_proc (work_file,out_str)
print "*** check tttt ***<br />"

curl_put_proc (url,out_str.encode('utf-8'))
#file_upload_proc (url,work_file)
#
#
print "OK<br />"
#
