#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcached_python_delete.py
#
#						Oct/15/2014
#
#
import sys
import json
#
import	cgi
import	string
import	memcache
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_delete_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
mc = memcache.Client(['127.0.0.1:11211'])
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
	print ("key_in = %s<br />" % key_in)
	mcache_delete_proc	(mc,key_in)
#
#
#
print ("OK<br />")
#
# ---------------------------------------------------------------
