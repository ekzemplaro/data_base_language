# -*- coding: utf-8 -*-
#
#	update/xml_update.py
#
#						Oct/21/2014
#
import	sys
import	xml.dom.minidom
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_to_str_proc
from file_io import file_write_proc
from text_manipulate import dict_update_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
xml_file = sys.argv[1]
id_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))
#
xml_str=file_to_str_proc (xml_file)
dict_aa = xml_to_dict_proc (xml_str)
#
dict_update_proc (dict_aa,id_in,population_in)
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file,out_str)
#
print ("*** 終了 ***")
# --------------------------------------------------------------------
