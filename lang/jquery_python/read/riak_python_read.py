#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	riak_python_read.py
#
#						Feb/09/2015
#
#
# ---------------------------------------------------------------------
import sys
import json
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from riak_manipulate import riak_to_dict_proc
# ---------------------------------------------------------------------
print ("Content-type: text/json\n\n")

url_shimane = 'http://host_ubuntu1:8098/riak/shimane'
#
dict_aa = riak_to_dict_proc (url_shimane)
#
str_json = json.dumps (dict_aa)
#
sys.stdout.write (str_json)
#
# ---------------------------------------------------------------------
