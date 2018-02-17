#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	python/update/xml_update.py
#
#						Jul/25/2014
#
# --------------------------------------------------------------------
import	xmltodict
import	dicttoxml
import	sys
import	string
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_to_str_proc
from file_io import file_write_proc
from text_manipulate import dict_update_proc
#
# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
xml_file = sys.argv[1]
key_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (key_in, population_in))
#
xml_str=file_to_str_proc (xml_file)
dict_aa = xmltodict.parse(xml_str)['root']
#
dict_update_proc (dict_aa,key_in,population_in)
#
byte_str = dicttoxml.dicttoxml(dict_aa,attr_type=False)
out_str = byte_str.decode('utf8')
file_write_proc (xml_file,out_str)
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
