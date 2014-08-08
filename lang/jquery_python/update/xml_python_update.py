#! /usr/bin/python3
#
#	xml_python_update.py
#
#					Jul/31/2014
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
from file_io import file_to_str_proc
from file_io import file_write_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
from text_manipulate import dict_update_proc
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
my_data = ff.getfirst ("my_data","")
#
print ("my_data = " + my_data + ":<p />\n")
#
json_str = my_data;
print ("json_str = " + json_str + "<br />")
array_bb = json.loads (json_str);
#
print ("len(array_bb) = %d<p />\n" % len(array_bb))
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("id_in = %s<br />" % id_in)
	print ("population_in = %d<br />" % population_in)
	dict_update_proc (dict_aa,id_in,population_in)
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str)
#
os.chmod (xml_file,0o666)
#
print ("OK")
#
# ---------------------------------------------------------------
