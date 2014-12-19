#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_python_delete.py
#
#						Dec/09/2014
#
#
import sys
import json
#
import	cgi
import	string
import	redis
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
# -------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	key_in = array_bb[it]
	print ("id_in = %s<br />" % key_in)
#
	str_key = str (key_in)
	rr.delete (str_key)
#
#
print ("OK<br />")
#
# ---------------------------------------------------------------
