#! /usr/bin/jython  
# -*- coding: utf-8 -*-
#
#
#	xml_create.py
#
#				May/27/2015
#
#
import	sys
import	string
#
from java.lang import	*
from java.io import	*
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from xml_manipulate import dict_to_xml_proc
# --------------------------------------------------------------------
def	tag_out_proc	(tag,str_value_in):
	out_str = "\t<" + tag + ">"
#	out_str += str_value_in.encode ('utf-8');
	out_str += str_value_in;
	out_str += "</" + tag + ">\n"
	return	out_str
# --------------------------------------------------------------------
def to_xml_convert_proc (array_bb):
	out_str = "<?xml version=\"1.0\"?>\n";
	out_str += "<root>\n";
#
	for city in array_bb['cities']:
		out_str += "<cities>\n"
#
		out_str += tag_out_proc	("id",str(city['id']))
		out_str += tag_out_proc	("name",city['name'])
		out_str += tag_out_proc	("population",str(city['population']))
		out_str += tag_out_proc	("date_mod",city['date_mod'])
#
		out_str += "</cities>\n"
	out_str += "</root>\n"
#
	return	out_str
#
# --------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t2261','静岡',48157,'2004-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2262','浜松',32785,'2004-5-4')
#
	dict_aa = dict_append_proc (dict_aa,'t2263','沼津',85427,'2004-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2264','三島',95638,'2004-9-15')
	dict_aa = dict_append_proc (dict_aa,'t2265','富士',34216,'2004-2-19')
	dict_aa = dict_append_proc (dict_aa,'t2266','熱海',68329,'2004-6-14')
	dict_aa = dict_append_proc (dict_aa,'t2267','富士宮',24257,'2004-3-11')
	dict_aa = dict_append_proc (dict_aa,'t2268','藤枝',46879,'2004-9-12')
	dict_aa = dict_append_proc (dict_aa,'t2269','御殿場',39782,'2004-8-23')
	dict_aa = dict_append_proc (dict_aa,'t2270','島田',42653,'2004-10-4')
#
#
	return	dict_aa
#
# --------------------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))
#
xml_file = sys.argv[1]
#
print	xml_file
#
dict_aa = data_prepare_proc ()
#
out_str = dict_to_xml_proc (dict_aa)
#
fp_file = File (xml_file)
filewriter = FileWriter (fp_file)
bw = BufferedWriter (filewriter)
#
pw = PrintWriter (bw)
#
pw.print (String (out_str,"utf-8"))
pw.close ()
#
#file_write_proc (xml_file,out_str)

#
#System.out.println (out_str);
#
System.out.println (String ("*** 終了 ***","utf-8"))
# --------------------------------------------------------------------
