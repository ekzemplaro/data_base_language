#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	jython_common/jython_xml_manipulate.py
#
#						May/31/2012
import xml.dom.minidom
import datetime
#
import	java
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
from java.lang import	*
# --------------------------------------------------------------------
import xml.dom.minidom
#import datetime
sys.path.append ('/var/www/data_base/common/python_common')
#

from text_manipulate import dict_append_proc
from to_utf8 import to_utf8_proc
# --------------------------------------------------------------------
def	jython_xml_to_dict_proc (xml_str_in):
	dict_aa = {}
#
	dom_in=xml.dom.minidom.parseString (xml_str_in)
	cities=dom_in.getElementsByTagName ("name")
	llx=len (cities)

	for city in cities:
		parent=city.parentNode
		id = parent.tagName
		name=parent.getElementsByTagName ("name")[0].firstChild.nodeValue
		name = to_utf8_proc (name)
		population=parent.getElementsByTagName ("population")[0].firstChild.nodeValue
		date_mod=parent.getElementsByTagName ("date_mod")[0].firstChild.nodeValue
#
		dict_aa = dict_append_proc (dict_aa,id,name,population,date_mod)
#
	return	dict_aa
# --------------------------------------------------------------------
