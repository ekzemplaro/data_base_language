#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	python/read/xml_read.py
#
#						May/31/2012
import xml.dom.minidom
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_to_str_proc
from xml_manipulate import xml_to_dict_proc
from text_manipulate import dict_append_proc
from text_manipulate import dict_display_proc
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
xml_file=sys.argv[1]
#
xml_str=file_to_str_proc (xml_file)
dict_aa = xml_to_dict_proc (xml_str)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# --------------------------------------------------------------------
