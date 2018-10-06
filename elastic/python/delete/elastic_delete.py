#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	elastic_delete.py
#
#					Oct/05/2018
#
# -------------------------------------------------------------------
import	sys
import	requests
#
# -------------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
print("%s" % key_in)
#
url = "http://localhost:9200/cities/tochigi/" + key_in
rr=requests.delete(url)
#
sys.stderr.write("*** 終了 ***\n")
# -------------------------------------------------------------------
