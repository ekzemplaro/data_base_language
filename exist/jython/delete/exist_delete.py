#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	exist/python/delete/exist_delete.py
#
#				Aug/23/2010
#
# ------------------------------------------------------------------
import os
import sys
import	urllib
import xml.dom.minidom
import pycurl
import string
#
sys.path.append ("/var/www/uchida/data_base/common/python_common")
#
from xml_disp import xml_disp_proc
from xml_disp import xml_write_proc
from dom_update import dom_delete_proc
#
from exist_fetch import exist_fetch_proc
from exist_fetch import exist_file_upload
# ------------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = string.atoi (sys.argv[1])
print ("%d" % id_in)
#
collections = 'cities'
xml_file = "cities.xml"
dom_aa = exist_fetch_proc (collections,xml_file)
#
dom_delete_proc (dom_aa,id_in)
#
xml_disp_proc (dom_aa)
#
work_file="/tmp/cities_tmp095.xml"
xml_write_proc (work_file,dom_aa)
#
exist_file_upload (collections,xml_file,work_file)
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
