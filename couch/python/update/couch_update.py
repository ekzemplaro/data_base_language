#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	update/couch_update.py
#
#					Aug/13/2017
#
# ----------------------------------------------------------------
import	os
import sys
import string
import json
import datetime
import requests
#
sys.path.append ('../../../common/python_common')
#
from requests_get import requests_get_proc
from requests_get import requests_put_proc
#
# ----------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
population_in = int(sys.argv[2])
print("%s\t%d" % (key_in, population_in))
#
url_json = 'http://localhost:5984/nagano'
url_key = url_json + '/' + key_in
#
str_buf_aa = requests_get_proc(url_key)
#
print("len (str_buf) = %d\n" % len(str_buf_aa))
#
unit_aa = json.loads(str_buf_aa)
print(unit_aa)
print(unit_aa['name'])
unit_aa['population'] = population_in
unit_aa['date_mod'] = '%s' % datetime.date.today()
#
out_str = json.dumps(unit_aa)
#
print(out_str)
#
requests_put_proc(url_key,out_str)
#
sys.stderr.write("*** 終了 ***\n")
#
# ----------------------------------------------------------------
