#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	python/read/xml_read.py
#
#						Feb/17/2018
#
# --------------------------------------------------------------------
import	xmltodict
import	sys
sys.path.append ('/var/www/data_base/common/python_common')
#
from file_io import file_to_str_proc
from text_manipulate import dict_display_proc
# --------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
xml_file=sys.argv[1]
#
try:
	xml_str=file_to_str_proc (xml_file)
	dict_aa = xmltodict.parse(xml_str)['root']
	dict_display_proc(dict_aa)
except Exception as ee:
	sys.stderr.write("*** error *** in xml_read.py ***\n")
	sys.stderr.write(str(ee) + "\n")
#
sys.stderr.write("*** 終了 ***\n")
# --------------------------------------------------------------------
