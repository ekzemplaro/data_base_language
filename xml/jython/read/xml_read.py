#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	jython/read/xml_read.py
#
#						May/27/2015
#
# --------------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.path.append ('/var/www/data_base/common/jython_common')
#
from jython_xml_manipulate import jython_xml_to_dict_proc
#
from jython_text_manipulate import dict_display_proc
from jython_file_io import file_to_str_proc
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
xml_file="/var/tmp/xml_file/cities.xml"
#
xml_str=file_to_str_proc (xml_file)
dict_aa = jython_xml_to_dict_proc (xml_str)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# --------------------------------------------------------------------
