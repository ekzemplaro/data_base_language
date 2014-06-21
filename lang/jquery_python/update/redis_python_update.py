#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	redis_python_update.py
#
#						Jul/20/2011
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
from mcache_manipulate import mcache_update_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
# -------------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
	print "check bbbbbbb<br />"
	mcache_update_proc	(rr,id_in,population_in)
	print "redis_update check cccccc<br />"
#
#
#
print "OK<br />"
#
