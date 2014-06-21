#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	voldemort_delete.py
#
#					Jan/27/2012
import voldemort
import json
import sys
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from voldemort_manipulate import voldemort_to_dict_proc
# ------------------------------------------------------------
print	("*** 開始 ***")
#
client = voldemort.StoreClient('cities', [('localhost', 6666)])

key_in = sys.argv[1]

print ("%s" % key_in)

client.delete(key_in)
#
dict_aa = voldemort_to_dict_proc (client)
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
# ------------------------------------------------------------
