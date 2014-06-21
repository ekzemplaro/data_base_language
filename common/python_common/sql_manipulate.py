#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	python_common/sql_manipulate.py
#
#				May/30/2012
#
# --------------------------------------------------------
import	string
import	datetime
from time import localtime,strftime
#
from to_utf8 import to_utf8_proc
#
# --------------------------------------------------------
def	sql_to_dict_proc	(cursor):
	dict_aa = {}
	sql_str=u"select ID, Name, Population, Date_Mod from cities order by ID"
	cursor.execute (sql_str)
	rows = cursor.fetchall ()
	for row in rows:
		if (row[0][0] == "t"):
			dd_str = "%s" % row[3]
			unit_aa = {}
			unit_aa['name'] = row[1]
			unit_aa['population'] = row[2]
			unit_aa['date_mod'] = dd_str
			dict_aa[row[0]] = unit_aa
#
	return	dict_aa
#
# --------------------------------------------------------
def	sql_display_proc	(cursor):
	print ("*** display start ***")
	sql_str=u"select ID, Name, Population, Date_Mod from cities order by ID"
	cursor.execute (sql_str)
	rows = cursor.fetchall ()
	for row in rows:
#		print row[0],to_utf8_proc (row[1]),row[2],row[3]
		print row[0],row[1],row[2],row[3]
	print ("*** display end ***")
#
# --------------------------------------------------------
def	sql_update_proc	(cursor_aa,id_in,ipop_in):
	print ("*** sql_update_proc ***")
	date_mod = strftime ("%Y-%m-%d",localtime ())
#
	ft_aa=u"update cities set POPULATION = %d, " % ipop_in
	ft_bb=u"DATE_MOD='%s' " % date_mod
	ft_cc=u"where ID = '%s'" % id_in
	sql_str=ft_aa + ft_bb + ft_cc
	print (sql_str)
	print ("aaaa***")
	cursor_aa.execute (sql_str)
	print ("bbbbbb***")
#
# --------------------------------------------------------
def	sql_delete_proc	(cursor_aa,id_in):
	print ("*** sql_delete_proc ***")
#
	sql_str=u"delete from cities where ID = '%s'" % id_in
	print (sql_str)
	cursor_aa.execute (sql_str)
#
# --------------------------------------------------------
def	table_insert_proc	(cursor,dict_aa):
	for key in dict_aa:
		unit = dict_aa[key]
		sql_insert_proc	(cursor,key,unit['name'], \
			unit['population'],unit['date_mod'])
#
# --------------------------------------------------------
def	sql_insert_proc	(cursor_aa,id_in,name_in,ipop_in,date_mod_in):
#	print ("*** sql_insert_proc ***")
#
	ft_aa="insert into cities (id,name,population,date_mod) values ("
	ft_bb ="'%s','%s',%d,'%s')" % (id_in,name_in,ipop_in,date_mod_in)
	sql_str=ft_aa + ft_bb
#	print (sql_str)
	cursor_aa.execute (sql_str)
#
#
# --------------------------------------------------------
def	create_table_proc (cursor_aa):
#	sql_str=u"create table cities (id varchar(10), name varchar(20)," \
#		+ u" population int, date_mod date)"
	sql_str="create table cities (id varchar(10), name varchar(20)," \
		+ " population int, date_mod date)"
	cursor_aa.execute (sql_str)
#
# --------------------------------------------------------
def	drop_table_proc (cursor_aa):
	sql_str=u"drop table cities"
	cursor_aa.execute (sql_str)
#
# --------------------------------------------------------
