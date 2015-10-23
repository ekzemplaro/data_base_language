#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	jython_common/jython_xml_disp.py
#
#						Jul/02/2011
import xml.dom.minidom
import datetime
#
import	java
import sys
from java.lang import	*
# --------------------------------------------------------------------
def	xml_disp_proc (dom_in):
	cities=dom_in.getElementsByTagName ("name")
	for city in cities:
		parent=city.parentNode
		id = parent.tagName
		name=city.firstChild.nodeValue
		population=parent.getElementsByTagName ("population")[0].firstChild.nodeValue
		date_mod=parent.getElementsByTagName ("date_mod")[0].firstChild.nodeValue
#
#		str_out  = id + "\t" + name + "\t" + population
		str_out  = id + "\t" + ("%s" % name) + "\t" + population
#
		dd_str = "%s" % date_mod
#
		str_out = str_out + "\t" + dd_str
#		System.out.println (java.lang.String (str_out).getBytes ("utf-8"));
		System.out.println (str_out)
#		print str_out
#
# --------------------------------------------------------------------
def	xml_write_proc (xml_file,doc_in):
	out_str=doc_in.toxml ("utf-8")
	fp_out = open (xml_file,'w')
	fp_out.write (out_str)
	fp_out.close ()
#
# --------------------------------------------------------------------
def	tag_out_proc	(tag,str_value_in):
	out_str = "\t<" + tag + ">"
	out_str += str_value_in.encode ('utf-8');
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
