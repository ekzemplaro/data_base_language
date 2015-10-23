# -*- coding: utf-8 -*-
#
#	delete/xml_delete.pyx
#
#						Oct/21/2014
#
import xml.dom.minidom
import	sys
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_to_str_proc
from file_io import file_write_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
from text_manipulate import dict_delete_proc
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
xml_file = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)
#
xml_str=file_to_str_proc (xml_file)
dict_aa = xml_to_dict_proc (xml_str)
#
dict_bb=dict_delete_proc (dict_aa,id_in)
#
out_str = dict_to_xml_proc (dict_bb)
file_write_proc (xml_file,out_str)
#
#
print ("*** 終了 ***")
# --------------------------------------------------------------------
