# -*- coding: utf-8 -*-
#
#	cassandra_manipulate.py
#
#					Sep/06/2013
#
import	string
import	datetime
#
# -------------------------------------------------------------------
def cassandra_to_dict_proc (cursor):
	str_cql = "select key,name,population,date_mod from cities"

	cursor.execute (str_cql)
	rows = cursor.fetchall ()
	dict_aa = {}
	for row in rows:
		unit_aa = {}
		unit_aa['name'] = row[1]
		unit_aa['population'] = row[2]
		unit_aa['date_mod'] = row[3]
		dict_aa[row[0]] = unit_aa
#
	return	dict_aa
# -------------------------------------------------------------------
def dict_to_cassandra_proc (dict_aa,cursor):
	str_cql = "drop table cities"
	cursor.execute (str_cql)
	str_cql = "create table cities (key varchar primary key,name text,population int,date_mod timestamp);"
	cursor.execute (str_cql)
#
	for key in dict_aa.keys ():
		unit = dict_aa[key]
		str_cql = \
		"insert into cities (key,name,population,date_mod) values ('%s','%s',%d,'%s');" \
		% (key,unit['name'],unit['population'],unit['date_mod'])
		print (str_cql)
		cursor.execute (str_cql)
# -------------------------------------------------------------------
def	cassandra_update_proc (cursor,key,population_in):
	print ("*** cassandra_update_proc *** aaa ***")
	ddx = string.split ("%s" % datetime.datetime.now ())
	print ("*** cassandra_update_proc *** bbb ***")
	today = ddx[0]
#
	str_cql = "update cities set population = %d,date_mod = '%s' where key = '%s';" \
	% (population_in,today,key)
	print (str_cql)
	print ("*** cassandra_update_proc *** ddd ***")
	cursor.execute (str_cql)
	print ("*** cassandra_update_proc *** fff ***")
#
# -------------------------------------------------------------------
def	cassandra_delete_proc (cursor,key):
	print ("*** cassandra_delete_proc ***")
#
	str_cql = "delete from cities where key = '%s';" % key
	print (str_cql)
	cursor.execute (str_cql)
#
# -------------------------------------------------------------------
