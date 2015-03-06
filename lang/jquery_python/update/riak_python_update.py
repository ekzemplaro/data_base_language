#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#
#	riak_python_update.py
#
#					Feb/09/2015
#
# ------------------------------------------------------------------
import	cgi
import	sys
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from cgi_manipulate import parse_parameter
#
from riak_manipulate import riak_update_proc
# ------------------------------------------------------------------
url_base = 'http://localhost:8098/riak/shimane'
#
# ------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
# ---------------------------------------------------------------
#
array_bb = parse_parameter ()
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
#
	riak_update_proc (url_base,id_in,population_in)
#
print ("OK<br />")
#
# ---------------------------------------------------------------
