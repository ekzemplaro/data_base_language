#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	python_common/db2_display.py
#					Mar/22/2009
#
# --------------------------------------------------------
import sys
import ibm_db
from time import localtime,strftime
#
#
# --------------------------------------------------------
def db2_display_proc (conn):
	sql_str = 'select * from cities'
	stmt = ibm_db.prepare (conn, sql_str)
	ibm_db.execute (stmt)
#
	row = ibm_db.fetch_tuple (stmt)
#
	while (row):
		print row[0],row[1],row[2],row[3]
		row = ibm_db.fetch_tuple(stmt)
#
# --------------------------------------------------------
def db2_update_proc (conn,id,ipop):
	date_mod = strftime ("%Y-%m-%d",localtime ())

	ft_aa="update cities set POPULATION = %d, " % ipop
	ft_bb="DATE_MOD='%s' " % date_mod
	ft_cc="where ID = %d" % id
	sql_str=ft_aa + ft_bb + ft_cc
#
	stmt = ibm_db.prepare (conn, sql_str)
	ibm_db.execute (stmt)
#
# --------------------------------------------------------
def	db2_to_json_proc (conn):
	sql_str = 'select * from cities'
	stmt = ibm_db.prepare (conn, sql_str)
	ibm_db.execute (stmt)
#
	row = ibm_db.fetch_tuple (stmt)
#
#
	str_aa='{"cities":['

#	for row in rows:
	while (row):
		str_unit = '{"id":%d,"name":"%s","population":%s,"date_mod":"%s"}' \
		% (row[0],row[1],row[2],row[3])
		str_aa += str_unit
		row = ibm_db.fetch_tuple(stmt)
		if (row): 
			str_aa += ','
		else:
			str_aa += ']}'
#
	print "Content-type: text/json\n\n"
	print	str_aa
#
# --------------------------------------------------------
