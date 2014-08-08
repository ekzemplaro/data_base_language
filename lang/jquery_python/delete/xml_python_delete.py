#! /usr/bin/python3
#
#	xml_python_delete.py
#
#					Jul/25/2011
#
# ---------------------------------------------------------------
import xml.dom.minidom
import	math
import	cgi
import	string
import	sys
import	os
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_to_str_proc
from file_io import file_write_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
from text_manipulate import dict_delete_proc
# ---------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
xml_file="/var/tmp/xml_file/cities.xml"
#
xml_str=file_to_str_proc (xml_file)
dict_aa = xml_to_dict_proc (xml_str)
#
#
ff=cgi.FieldStorage ()
#
print ("*** check ppppp ***<br />")
my_data = ff.getfirst ("my_data","")
#
print ("my_data = " + my_data + ":<p />\n")
#
json_str = my_data;
print ("*** check qqqq ***<br />")
print ("json_str = " + json_str + "<br />")
print ("*** check rrrr ***<br />")
array_bb = json.loads (json_str);
#
print ("len(array_bb) = %d<p />\n" % len(array_bb))
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print ("id_in = %s<br />" % id_in)
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str)
#
os.chmod (xml_file,0o666)
#
print ("OK")
#
# ---------------------------------------------------------------
