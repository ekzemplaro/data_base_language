#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	neo4j_manipulate.py
#
#					Aug/30/2012
#
import sys
import pycurl
import StringIO
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
#
# ----------------------------------------------------------------
def	row_parser (key):
	url_json = 'http://localhost:7474/db/data/node/%d/properties' % key

	str_tmp = curl_get_proc (url_json)
#	print	str_tmp
	unit_aa = json.loads (str_tmp)

	if 'id' in unit_aa:
		print unit_aa['id'],"\t",
		print unit_aa['name'],"\t",
		print unit_aa['population'],"\t",
		print unit_aa['date_mod']
# ----------------------------------------------------------------
def	neo4j_display_proc ():
	for key in range (1,10):
		row_parser (key)
#
# ----------------------------------------------------------------
