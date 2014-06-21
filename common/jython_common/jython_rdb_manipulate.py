#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	jython_rdb_manipulate.py
#					Jun/01/2011
#
# ----------------------------------------------------------------
import	datetime
from time import localtime,strftime
# ----------------------------------------------------------------
#
import sys
import	string
from java.lang import	System
#
import java
from java.sql import *
#
# ----------------------------------------------------------------
def display_proc (conn):
	stmt = conn.createStatement()
	rset = stmt.executeQuery("select * from cities")
	while rset.next():
		id = rset.getString(1)
		name = rset.getString(2)
		population = rset.getString(3)
		date_mod = rset.getString(4)
		out_str = id + "\t" + name + "\t" + population + "\t" + date_mod
		System.out.println (out_str)
#
	rset.close()
	stmt.close()
#
# ----------------------------------------------------------------
def update_proc (conn,id_in,population_in):
	str_ddx = strftime ("%Y-%m-%d",localtime ())
	stmt = conn.createStatement()
	str_sql = "update cities set POPULATION=" + str(population_in) \
		+ ",DATE_MOD='" + str_ddx +  "'  where ID= '" + id_in + "'";

	System.out.println (str_sql)
	result = stmt.executeUpdate (str_sql)
#
	stmt.close()
# ----------------------------------------------------------------
def create_table_proc (conn):
	stmt = conn.createStatement()
	str_sql = "create table cities (id varchar(10), name varchar(20)," \
		+ " population int, date_mod date)"
	result = stmt.executeUpdate (str_sql)
	stmt.close()

# ----------------------------------------------------------------
def drop_table_proc (conn):
	stmt = conn.createStatement()
	str_sql = "drop table cities"
	result = stmt.executeUpdate (str_sql)
	stmt.close()
# ----------------------------------------------------------------
def insert_record_proc (conn,key,value):
	stmt = conn.createStatement()
	str_ins = "insert into cities (id,name,population,date_mod) values ("

	str_data = "'" + key + "','" + value['name'] + "'," \
		+ str(value['population']) + ",'" + value['date_mod'] + "')"

	str_sql = str_ins + str_data
	result = stmt.executeUpdate (str_sql)
	stmt.close()
#
# ----------------------------------------------------------------
def delete_proc (conn,id_in):
	stmt = conn.createStatement()
	str_sql = "delete from  cities where ID= '" + id_in + "'"
	result = stmt.executeUpdate (str_sql)
	stmt.close()
#
# ----------------------------------------------------------------
def table_insert_proc (conn,dict_aa):
	for key in dict_aa:
		insert_record_proc (conn,key,dict_aa[key])
# ----------------------------------------------------------------
def mysql_utf8_proc (conn):
	stmt = conn.createStatement()
	str_sql = "SET NAMES utf8"
	result = stmt.executeUpdate (str_sql)
	stmt.close()
	
# ----------------------------------------------------------------
