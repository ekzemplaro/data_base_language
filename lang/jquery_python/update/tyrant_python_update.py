#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	tyrant_python_update.py
#
#						Feb/10/2015
#
# ----------------------------------------------------------------
import sys
import json
#
import	cgi
import	string
import memcache
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_update_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
mc = memcache.Client(['host_ubuntu1:1978'])
#
# -------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("id_in = %s<br />" % id_in)
	print ("population_in = %d<br />" % population_in)
	mcache_update_proc	(mc,id_in,population_in)
#
#
#
print ("OK<br />")
#
