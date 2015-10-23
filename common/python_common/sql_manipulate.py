# -*- coding: utf-8 -*-
#
#	python_common/sql_manipulate.py
#
#				Mar/18/2015
#
# --------------------------------------------------------
import	sys
import	string
import	datetime
from time import localtime,strftime
#
from to_utf8 import to_utf8_proc
#
# --------------------------------------------------------
def	sql_to_dict_proc	(cursor):
	dict_aa = {}
	sql_str=u"select id, name, population, date_mod from cities order by id"
	cursor.execute (sql_str)
	rows = cursor.fetchall ()
	for row in rows:
#		print (row)
		if (row['id'][0] == "t"):
#		if (row[0][0] == "t"):
#			dd_str = "%s" % row[3]
			unit_aa = {}
			unit_aa['name'] = row['name']
			unit_aa['population'] = row['population']
			unit_aa['date_mod'] = str (row['date_mod'])
			dict_aa[row['id']] = unit_aa
#
	return	dict_aa
#
# --------------------------------------------------------
def	sql_display_proc	(cursor):
	print ("*** display start ***")
	sql_str=u"select id, name, population, date_mod from cities order by id"
	cursor.execute (sql_str)
	rows = cursor.fetchall ()
	for row in rows:
		print (row[0],row[1],row[2],row[3])
	print ("*** display end ***")
#
# --------------------------------------------------------
def	sql_update_proc	(cursor_aa,id_in,ipop_in):
#
	sql_str = sql_update_string_gen_proc      (id_in,ipop_in)
	cursor_aa.execute (sql_str)
# --------------------------------------------------------
def	sql_update_string_gen_proc	(id_in,ipop_in):
	date_mod = strftime ("%Y-%m-%d",localtime ())
	ft_aa=u"update cities set population = %d, " % ipop_in
	ft_bb=u"date_mod='%s' " % date_mod
	ft_cc=u"where id = '%s'" % id_in
	sql_str=ft_aa + ft_bb + ft_cc
	print (sql_str)
#
	return	sql_str
# --------------------------------------------------------
def	sql_delete_proc	(cursor_aa,key_in):
	print ("*** sql_delete_proc ***")
#
	sql_str = sql_delete_string_gen_proc (key_in)
	cursor_aa.execute (sql_str)
# --------------------------------------------------------
def	sql_delete_string_gen_proc	(key_in):
	sql_str=u"delete from cities where id = '%s'" % key_in
	print (sql_str)
#
	return	sql_str
# --------------------------------------------------------
def	table_insert_proc	(cursor,dict_aa):
	for key in dict_aa:
		unit = dict_aa[key]
		try:
			sql_insert_proc	(cursor,key,unit['name'], \
				unit['population'],unit['date_mod'])
		except Exception as ee:
			sys.stderr.write ("*** error *** table_insert_proc ***\n")
			sys.stderr.write (str (ee) + "\n")
			sys.stderr.write (key + "\n")
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
	sql_str="create table cities (id varchar(10), name varchar(20)," \
		+ " population int, date_mod date)"
#
	try:
		cursor_aa.execute (sql_str)
	except Exception as ee:
		sys.stderr.write ("*** error *** create_table_proc ***\n")
		sys.stderr.write (str (ee) + "\n")
#
# --------------------------------------------------------
def	drop_table_proc (cursor_aa):
	sql_str=u"drop table cities"
	try:
		cursor_aa.execute (sql_str)
	except Exception as ee:
		sys.stderr.write ("*** error *** drop_table_proc ***\n")
		sys.stderr.write (str (ee) + "\n")
#
# --------------------------------------------------------
