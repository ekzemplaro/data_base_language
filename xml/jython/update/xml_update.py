#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	update/xml_update.py
#
#						May/27/2015
import xml.dom.minidom
import datetime
import	sys
import	string
sys.path.append ('/var/www/data_base/common/python_common')
sys.path.append ('/var/www/data_base/common/jython_common')
#
from jython_file_io import file_to_str_proc
from jython_file_io import file_write_proc
from jython_text_manipulate import dict_update_proc
from jython_xml_manipulate import jython_xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
#
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#

xml_file="/var/tmp/xml_file/cities.xml"
#
xml_str=file_to_str_proc (xml_file)
#
dict_aa = jython_xml_to_dict_proc (xml_str)
#
dict_update_proc (dict_aa,id_in,population_in)
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str.encode('utf-8'))
#
print ("*** 終了 ***")
# --------------------------------------------------------------------
