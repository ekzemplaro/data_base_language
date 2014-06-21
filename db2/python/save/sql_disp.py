#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_update.py
#
#				Feb/26/2010
#
# --------------------------------------------------------
import kinterbasdb
from time import localtime,strftime
import datetime
#
#
# --------------------------------------------------------
def	sql_display_proc	(cursor):
	print ("*** display start ***")
	sql_str="select ID, Name, Population, Date_Mod from cities order by ID"
	cursor.execute (sql_str)
	rows = cursor.fetchall ()
	for row in rows:
		print row[0],row[1],row[2],row[3]
	print ("*** display end ***")
#
# --------------------------------------------------------
def	sql_update_proc	(cursor,id,ipop):
	date_mod = strftime ("%Y-%m-%d",localtime ())
#
	ft_aa="update cities set POPULATION = %d, " % ipop
	ft_bb="DATE_MOD='%s' " % date_mod
	ft_cc="where ID = %d" % id
	sql_str=ft_aa + ft_bb + ft_cc
	cursor.execute (sql_str)
#	print (sql_str)
#
# --------------------------------------------------------
