#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	python_common/dom_update.py
#
#						Aug/23/2010
import xml.dom.minidom
import datetime
import	sys
import	string
#
# --------------------------------------------------------------------
def	dom_update_proc (dom,id_in,population_in):
	cities=dom.getElementsByTagName ("cities")
	for city in cities:
		id_aa = city.getElementsByTagName ("id")[0].firstChild.nodeValue
		id = string.atoi (id_aa)
		if (id_in == id):
			date_mod = datetime.datetime.today ()
			city.getElementsByTagName ("population")[0].firstChild.nodeValue = "%d" % population_in
			city.getElementsByTagName ("date_mod")[0].firstChild.nodeValue = "%s" % date_mod
# --------------------------------------------------------------------
def	dom_delete_proc (doc_in,id_in):
	root=doc_in.documentElement
	cities=doc_in.getElementsByTagName ("cities")
	node_list = doc_in.childNodes
	for city in cities:
		id_aa = city.getElementsByTagName ("id")[0].firstChild.nodeValue
		id = string.atoi (id_aa)
		if (id_in == id):
			print ("dom_delete_proc *** aaa")
			root.removeChild (city)

			break
#
# --------------------------------------------------------------------
# --------------------------------------------------------------------
