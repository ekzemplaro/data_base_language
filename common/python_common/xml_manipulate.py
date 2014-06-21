#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	python_common/xml_manipulate.py
#
#						May/13/2011
import xml.dom.minidom
#
from text_manipulate import dict_append_proc
from to_utf8 import to_utf8_proc
#
# --------------------------------------------------------------------
def	xml_to_dict_proc (xml_str_in):
	dict_aa = {}
#
	dom_in=xml.dom.minidom.parseString (xml_str_in)
	cities=dom_in.getElementsByTagName ("name")
	llx=len (cities)

	for city in cities:
		parent=city.parentNode
		id = parent.tagName
		name=parent.getElementsByTagName ("name")[0].firstChild.nodeValue
#		name = to_utf8_proc (name)
		population=parent.getElementsByTagName ("population")[0].firstChild.nodeValue
		date_mod=parent.getElementsByTagName ("date_mod")[0].firstChild.nodeValue
#
		dict_aa = dict_append_proc (dict_aa,id,name,population,date_mod)
#
	return	dict_aa
# --------------------------------------------------------------------
def	xml_to_json_proc (xml_str_in):
	dom_in=xml.dom.minidom.parseString (xml_str_in)
	json_str='{"cities":['
	cities=dom_in.getElementsByTagName ("cities")
	llx=len (cities)
	it=0
	for city in cities:
		id=city.getElementsByTagName ("id")[0].firstChild.nodeValue
		name=city.getElementsByTagName ("name")[0].firstChild.nodeValue
		name = to_utf8_proc (name)
		population=city.getElementsByTagName ("population")[0].firstChild.nodeValue
		date_mod=city.getElementsByTagName ("date_mod")[0].firstChild.nodeValue
#
		str_unit = '{"id":%s,"name":"%s","population":%s,"date_mod":"%s"}' \
			% (id,name,population,date_mod)
#
		json_str += str_unit
		it += 1
		if (it < llx):
			json_str += ','
		else:
			json_str += ']}'
#
	return	json_str
# --------------------------------------------------------------------
def dict_to_xml_proc (dict_aa):
	out_str = "<?xml version=\"1.0\"?>\n";
	out_str += "<root>\n";
#
#	print	"*** dict_to_xml_proc ***"
#
	for key in dict_aa:
#		print	("*** dict_to_xml_proc *** " + key)
		out_str += "<" + key + ">\n"
#
		unit_aa = dict_aa[key]
#		print	("*** dict_to_xml_proc *** aaaa " + key)
#		print	("*** dict_to_xml_proc *** bbbb " + unit_aa['name'])
#		name = to_utf8_proc (unit_aa['name'])
		name = "" + unit_aa['name']
		out_str += tag_out_proc	("name",name)
#		print	("*** dict_to_xml_proc *** ccc " + key)
		out_str += tag_out_proc	("population",str(unit_aa['population']))
		out_str += tag_out_proc	("date_mod",unit_aa['date_mod'])
#		print	("*** dict_to_xml_proc *** ddd *** " + key)
#
		out_str += "</" + key + ">\n"
	out_str += "</root>\n"
#
#	print	"*** dict_to_xml_proc *** end ***"
#
	return	out_str
#
# --------------------------------------------------------------------
def	tag_out_proc	(tag,str_value_in):
#	print	("*** tag_out_proc *** start ***" + str_value_in)
	out_str = "\t<" + tag + ">"
#	out_str += str_value_in.encode ('utf-8');
	out_str += str_value_in;
	out_str += "</" + tag + ">\n"
	return	out_str
# --------------------------------------------------------------------
