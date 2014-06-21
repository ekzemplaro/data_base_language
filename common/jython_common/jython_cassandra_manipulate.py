# -*- coding: utf-8 -*-
#
#	jython_cassandra_manipulate.py
#
#					Sep/06/2013
import	sys
import	string
import	datetime
from time import localtime,strftime
#
from text_manipulate import dict_append_proc
# ---------------------------------------------------------------
def cassandra_to_dict_proc (conn):
	print ("*** cassandra_to_dict_proc ***")
	dict_aa = {}
#
	sql_str="select key,name,population,date_mod from cities;"
	st = conn.createStatement()
	rset = st.executeQuery (sql_str)
#
	while rset.next():
		key = rset.getString(1)
		name = rset.getString(2)
		population = rset.getString(3)
		date_mod = rset.getString(4)
		dict_aa = dict_append_proc (dict_aa,key,name,population,date_mod)
#
	return	dict_aa
#
# ---------------------------------------------------------------
def dict_to_cassandra_proc (dict_aa,conn):
	sql_str="drop table cities;"
	st = conn.createStatement()
	st.execute (sql_str);
#
	sql_str="create table cities (key varchar primary key,name text,population int,date_mod timestamp);"
	st.execute (sql_str)
#
	for key in dict_aa.keys():
		unit_aa = dict_aa[key]
		name = unit_aa['name']
		population = unit_aa['population']
		date_mod = unit_aa['date_mod']
#
		str_aa = "insert into cities (key,name,population,date_mod) values "
		str_bb = "('" + key + "','" + name + "'," + str(population) + ",'" + date_mod + "')"
		sql_str = str_aa + str_bb
		print (sql_str)
		st.execute (sql_str)
#
	st.close()
# ---------------------------------------------------------------
def cassandra_update_proc (conn,key,population_in):
	print ("*** cassandra_update_proc ***")
#
	str_ddx = strftime ("%Y-%m-%d",localtime ())
	sql_str="update cities set population =" + str(population_in)
	sql_str += ", date_mod = '" + str_ddx + "'"
	sql_str += " where key = '" + key + "';"

	st = conn.createStatement()
	st.execute (sql_str)
	st.close()
# ---------------------------------------------------------------
def cassandra_delete_proc (conn,key):
	print ("*** cassandra_delete_proc ***")
#
	sql_str="delete from cities where key = '" + key + "';"

	st = conn.createStatement()
	st.execute (sql_str)
	st.close()
# ---------------------------------------------------------------
