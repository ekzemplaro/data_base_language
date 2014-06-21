#! /usr/bin/python
# -*- coding: utf-8 -*-
#	dbxml_manipulate.py
#
#						Jul/31/2012
#
#
# ---------------------------------------------------------------
import os
from bsddb3.db import *
from dbxml import *
import xml.dom.minidom
#
import	sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
# ---------------------------------------------------------------
def document_parser (dict_aa,value):
	document = value.asDocument()
	id = document.getName()
	dom_aa = xml.dom.minidom.parseString (value.asString())
	nnx = dom_aa.getElementsByTagName ("name")
	name = nnx[0].firstChild.nodeValue
	nny = dom_aa.getElementsByTagName ("population")
	population = nny[0].firstChild.nodeValue
	nnz = dom_aa.getElementsByTagName ("date_mod")
	date_mod = nnz[0].firstChild.nodeValue
	dict_aa = dict_append_proc (dict_aa,id,name,population,date_mod)
#
	return	dict_aa
# ---------------------------------------------------------------
def dbxml_to_dict_proc (file_dbxml):
	dict_aa = {}
	mgr=XmlManager()
	print mgr.get_version_string()
	container = mgr.openContainer(file_dbxml)
#
	qc = mgr.createQueryContext()
	str_query = "collection('%s')/*" % file_dbxml
	results = mgr.query(str_query, qc)
	for value in results:
		dict_aa = document_parser (dict_aa,value)
#
	return dict_aa
# ---------------------------------------------------------------
def	tag_add_proc	(tag,str_value_in):
	out_str = "<" + tag + ">"
	out_str += str_value_in
	out_str += "</" + tag + ">"
	return	out_str
# ---------------------------------------------------------------
def dict_to_dbxml_proc (dict_aa,file_dbxml):
	if (os.path.exists (file_dbxml)):
		os.remove (file_dbxml)

	mgr=XmlManager()
	uc = mgr.createUpdateContext()
	print mgr.get_version_string()

	container = mgr.createContainer(file_dbxml)

	for key in sorted (dict_aa.keys()):
		unit = dict_aa[key]
		tag_name = tag_add_proc ('name',unit['name'])
		tag_population = tag_add_proc ('population',str (unit['population']))
		tag_date_mod = tag_add_proc ('date_mod',unit['date_mod'])
		doc1 = '<' + key + '>'
		doc1 += tag_name
		doc1 += tag_population
		doc1 += tag_date_mod
		doc1 += '</' + key + '>'
		print key
		print doc1
		container.putDocument (key,doc1, uc)
# ---------------------------------------------------------------
