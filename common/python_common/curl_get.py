# -*- coding: utf-8 -*-
#
#	python_common/curl_get.py
#
#					Oct/31/2013
# ----------------------------------------------------------------
#
import os
import sys
import string
import pycurl
import StringIO
#
import json
#
# ----------------------------------------------------------------
str_buf_gg = ''
#
# ----------------------------------------------------------------
def add_data (buf):
	global str_buf_gg
	str_buf_gg += buf
#
# ----------------------------------------------------------------
def curl_get_proc (url_json):
	cc = pycurl.Curl()
	cc.setopt(cc.PROXY, '')
	cc.setopt(pycurl.URL, url_json)
	cc.setopt(pycurl.HTTPHEADER, ["Accept:"])
	bb = StringIO.StringIO()
	cc.setopt(pycurl.WRITEFUNCTION, bb.write)
	cc.setopt(pycurl.FOLLOWLOCATION, 1)
	cc.setopt(pycurl.MAXREDIRS, 5)
	cc.perform()
	rvalue = bb.getvalue()
#
	return rvalue
#
# ----------------------------------------------------------------
def curl_delete_proc (url_json):
	cc = pycurl.Curl()
	cc.setopt(cc.PROXY, '')
	cc.setopt (pycurl.URL,url_json )
	cc.setopt (pycurl.CUSTOMREQUEST, 'DELETE')
	cc.perform()
	cc.close()
#
# ----------------------------------------------------------------
def couch_drop_proc (url_collection):
	url_target = url_collection + '/cities'
	json_list=curl_get_proc (url_collection + '/_all_docs')
	list_hash=json.loads (json_list)
	for row in list_hash['rows']:
		if (row['id'] == "cities"):
#			url_delete = url_target + "?rev=" + row['value']['rev']
#			os.system ("curl -X DELETE " + url_delete)	
			curl_delete_proc (url_collection)
			curl_put_proc (url_collection,"")
# ----------------------------------------------------------------
def file_upload_proc (url,file_src):
	cc = pycurl.Curl ()
	cc.setopt(cc.PROXY, '')
	cc.setopt (pycurl.URL, url)
	cc.setopt (pycurl.UPLOAD, 1)
#
	fp_in = open (file_src,'rb')
#
	cc.setopt (pycurl.READFUNCTION, fp_in.read)
#
	filesize = os.path.getsize (file_src)
	cc.setopt (pycurl.INFILESIZE, filesize)
#
	print 'Uploading file %s to url %s' % (file_src, url)
	cc.perform ()
	cc.close ()
#
# ----------------------------------------------------------------
def curl_put_proc (url,out_str):
	tmp = os.tmpfile()
#	tmp.write(out_str.encode('utf-8'))
	tmp.write(out_str)
	tmp.seek(0)
#
	cc = pycurl.Curl ()
	cc.setopt(cc.PROXY, '')
	cc.setopt (pycurl.URL, url)
	cc.setopt (pycurl.PUT, 1)
	cc.setopt (pycurl.INFILE, tmp)
	cc.setopt (pycurl.INFILESIZE, len(out_str))
#
	cc.perform ()
	cc.close ()
#
# ----------------------------------------------------------------
