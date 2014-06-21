#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	read/neo4j_read.py
#
#					Jan/31/2012
#
import sys
import pycurl
import StringIO
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
from neo4j_manipulate import neo4j_display_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
neo4j_display_proc ()
#
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
