# -*- coding: utf-8 -*-
#
# --------------------------------------------------------------
#	jython_get_uri.py
#
#					Aug/21/2013
# --------------------------------------------------------------
import	httplib
from org.apache.commons.httpclient import HttpClient
from org.apache.commons.httpclient.methods import PutMethod
from org.apache.commons.httpclient.methods import DeleteMethod
from org.apache.commons.httpclient.methods import StringRequestEntity
# --------------------------------------------------------------
def get_uri_proc (host,path):
	conn = httplib.HTTPConnection (host)
	conn.request ("GET",path)
	r1 = conn.getresponse ()
#	print r1.status, r1.reason
	str_aaa = r1.read ()
	conn.close ()
	return	str_aaa
# --------------------------------------------------------------
def rest_put_proc (uri_aa,str_data_in,type_in):
	print ("*** rest_put_proc ***")
	put = PutMethod (uri_aa)
	entity = StringRequestEntity (str_data_in, type_in, "UTF-8")
	put.setRequestEntity (entity)

	httpclient = HttpClient()
	result = httpclient.executeMethod(put)
	print ("Response status code: %d" % result)
	put.releaseConnection()

# --------------------------------------------------------------
def rest_delete_proc (uri_aa):
	delete = DeleteMethod (uri_aa)
#
	httpclient = HttpClient ()
	result = httpclient.executeMethod (delete)
	print ("Response status code: %d" % result)
	delete.releaseConnection ()
# --------------------------------------------------------------
