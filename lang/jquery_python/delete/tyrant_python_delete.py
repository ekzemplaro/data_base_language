#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tyrant_python_delete.py
#
#						Jun/22/2012
#
#
import sys
import json
#
import	cgi
import	string
import memcache
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_delete_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
mc = memcache.Client(['127.0.0.1:1978'])
#
# -------------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	mcache_delete_proc	(mc,id_in)
	print "check cccccc<br />"
#
#
#
print "OK<br />"
#
