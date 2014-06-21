#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	voldemort_update.py
#
#					Jan/27/2012
import voldemort
import json
import sys
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import hash_update_proc
from voldemort_manipulate import voldemort_to_dict_proc
# ------------------------------------------------------------
print	("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))


client = voldemort.StoreClient('cities', [('localhost', 6666)])

resp = client.get (key_in)
json_str = resp[0][0]
print json_str
unit_aa =  json.loads (json_str)
hash_update_proc (unit_aa,population_in)
json_str = json.dumps (unit_aa)
print json_str
client.put (key_in,json_str)
#
#
dict_aa = voldemort_to_dict_proc (client)
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
# ------------------------------------------------------------
