#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	exist_update.py
#
#				Apr/21/2011
#
# ------------------------------------------------------------------
import os
import sys
import	urllib
import xml.dom.minidom
import pycurl
import cStringIO
import string
#
sys.path.append ("/var/www/uchida/data_base/common/jython_common")
#
from jython_xml_disp import xml_disp_proc
from xml_disp import xml_write_proc
from dom_update import dom_update_proc
#
from exist_fetch import exist_fetch_proc
from exist_fetch import exist_file_upload
# ------------------------------------------------------------------
def	try_uproad	(dom_in,collections,xml_file):
	out_str=dom_in.toxml ("utf-8")
	cc = pycurl.Curl ()
	url_base = 'http://admin:hello9@172.20.180.155:8086/exist/rest/db/'
	url = url_base + collections + '/' + xml_file
	cc.setopt (pycurl.URL, url)
#	cc.setopt (pycurl.READFUNCTION, fh.read)
#	cc.setopt (pycurl.READDATA, out_str)
	cc.setopt (pycurl.READFUNCTION, out_str)
	size = len (out_str)
	cc.setopt (pycurl.INFILESIZE,size)
#
	cc.perform ()
	cc.close ()
#
# ------------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = string.atoi (sys.argv[1])
population_in = string.atoi (sys.argv[2])
print ("%d\t%d" % (id_in, population_in))
#
collections = 'cities'
xml_file = "cities.xml"
dom_aa = exist_fetch_proc (collections,xml_file)
#
dom_update_proc (dom_aa,id_in,population_in)
#
jython_xml_disp_proc (dom_aa)
#try_uproad	(dom_aa,collections,xml_file)
#
work_file="/tmp/cities_tmp090.xml"
xml_write_proc (work_file,dom_aa)
#
exist_file_upload (collections,xml_file,work_file)
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
