#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	exist_read.py
#
#					Jun/22/2012
#
# ------------------------------------------------------------------
import	sys
import	httplib
#
from java.lang import	String
from java.lang import	System
#
sys.path.append ("/var/www/data_base/common/python_common")
sys.path.append ("/var/www/data_base/common/jython_common")
#
from jython_xml_manipulate import jython_xml_to_dict_proc
from text_manipulate import dict_display_proc
from jython_get_uri import get_uri_proc
#
# ------------------------------------------------------------------
System.out.println (String ("*** 開始 ***","utf-8"))
#
host="localhost:8086"
path = "/exist/rest/db/cities/cities.xml"
xml_str = get_uri_proc (host,path)
#
dict_aa = jython_xml_to_dict_proc (xml_str)
dict_display_proc (dict_aa)
#
System.out.println (String ("*** 終了 ***","utf-8"))
# ------------------------------------------------------------------
