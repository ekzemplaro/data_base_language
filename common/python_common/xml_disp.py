# -*- coding: utf-8 -*-
#
#	python_common/xml_disp.py
#
#						May/13/2011
import xml.dom.minidom
import datetime
#
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
#		str_out  = "\t" + name + "\t" + population
		str_out  = id + "\t" + name + "\t" + population
#
		dd_str = "%s" % date_mod
#
		str_out = str_out + "\t" + dd_str
		print str_out
#
# --------------------------------------------------------------------
def	xml_write_proc (xml_file,doc_in):
	out_str=doc_in.toxml ("utf-8")
	fp_out = open (xml_file,'w')
	fp_out.write (out_str)
	fp_out.close ()
#
# --------------------------------------------------------------------
