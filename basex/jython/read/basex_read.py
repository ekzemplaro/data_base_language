#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	basex_read.py
#
#					May/31/2012
#
# ------------------------------------------------------------------
import	sys
import	httplib
import	xml.dom.minidom
from java.lang import	String
from java.lang import	System
#
sys.path.append ("/var/www/data_base/common/python_common")
sys.path.append ("/var/www/data_base/common/jython_common")
#
from jython_xml_manipulate import jython_xml_to_dict_proc
from text_manipulate import dict_display_proc
#
# ------------------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))
#
#
conn = httplib.HTTPConnection ("localhost:8984")
conn.request ("GET","/rest/cities?query=/")
r1 = conn.getresponse ()
print r1.status, r1.reason
xml_str = r1.read ()
conn.close ()
#
dict_aa = jython_xml_to_dict_proc (xml_str)
dict_display_proc (dict_aa)
#
System.out.println (String ("*** 終了 ***","utf-8"))
# ------------------------------------------------------------------
