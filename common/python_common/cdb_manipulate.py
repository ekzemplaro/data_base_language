#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cdb_manipulate.py
#
#					Mar/26/2013
#
import	sys
import	string
import	cdb
import	json
import	os

# ---------------------------------------------------------------------
def cdb_read_proc (file_cdb):
	dict_aa = {}
	cdb_o = cdb.init (file_cdb)
	rr = cdb_o.each()
	while rr:
		unit = json.loads (rr[1])
		dict_aa[rr[0]] = unit
		rr = cdb_o.each()
#
	return dict_aa
# ---------------------------------------------------------------------
def cdb_write_proc (file_cdb,dict_aa):
	maker = cdb.cdbmake(file_cdb, file_cdb + ".tmp")
#
	for key in dict_aa.keys():
		unit = dict_aa[key]
		json_str = json.dumps (unit)
		maker.add(key,json_str)
	maker.finish()
	del(maker)
#
	os.chmod (file_cdb,0777)
# ---------------------------------------------------------------------
