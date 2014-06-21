#! /usr/bin/python
#
#	ftp_python_update.py
#
#					May/09/2013
#
# ------------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	os
import xml.dom.minidom
import pycurl
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
dict_aa = json.loads (str_buf_aa)
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
	dict_update_proc (dict_aa,id_in,population_in)
#
print "*** check couch qqqqq ***\n"
work_file="/tmp/cities_tmp04872.json"
out_str = json.dumps (dict_aa)
#
print ("*** check couch rrrrr ***\n")
print	(out_str)
#
file_write_proc (work_file,out_str)
print "*** check couch sssss ***\n"
file_upload_proc (url_json,work_file)
#
os.remove (work_file)
#
print "OK<br />"
#
