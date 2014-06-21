#! /usr/bin/python
#
#	ftp_python_delete.py
#
#					May/09/2013
#
# ------------------------------------------------------------------
import	cgi
import	string
import	sys
import	os
import	xml.dom.minidom
import	pycurl
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_delete_proc
from curl_get import curl_get_proc
from curl_get import file_upload_proc
from file_io	import file_write_proc
#
from cgi_manipulate import parse_parameter
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
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
print "*** check couch qqqqq ***\n"
work_file="/tmp/cities_tmp04957.json"
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
print "*** OK ***<br />"
#
