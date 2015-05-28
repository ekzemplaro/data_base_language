# -*- coding: utf-8 -*-
#
#	drizzle_manipulate.py
#
#						May/26/2015
#
import	os
from subprocess import Popen, PIPE
import	shlex
import	string
import	datetime
import	sys
#
from text_manipulate import dict_append_proc
from text_manipulate import text_write_proc
# ------------------------------------------------------------------
def drizzle_to_dict_proc (db_name):
	dict_aa = {}
#
	args = ["drizzle","-hlocalhost","-uscott",db_name]
	sql_file = "/var/www/data_base/common/bash_common/sql_files/drizzle/drizzle_read.sql"
	fp_in = open (sql_file,"r")
	result = Popen(args,stdin=fp_in,stdout=PIPE).stdout.readlines()

	fp_in.close ()
#
	for str in result:
		line = str.rstrip()
		if (5 < len (line)):
			cols= string.split (line)
			if (cols[0][0] == "t"):
				population = string.atoi (cols[2])
				dict_aa = dict_append_proc (dict_aa,cols[0], \
					cols[1],population,cols[3])
#
	return	dict_aa
# ------------------------------------------------------------------
def dict_to_sql_proc (sql_tmp,dict_aa):
	fp_out = open (sql_tmp,'w')
	str_out = "use city;\n"
	fp_out.write ( str_out)
	str_out = "drop table if exists cities;\n"
	fp_out.write ( str_out)
	str_out = "create table cities (id varchar(10) primary key, name text, population int, date_mod date);\n"
	fp_out.write ( str_out)
#
	for key in sorted (dict_aa.keys()):
		unit = dict_aa[key]
		name = unit['name']
		population = unit['population']
		date_mod = unit['date_mod']
		str_out = "insert into cities set id=\'"
		str_out += key + "',name='"
		str_out += name + "',population="
		str_out += ("%d" % population) + ",date_mod='"
		str_out += date_mod + "';\n"
		fp_out.write ( str_out)
	fp_out.close ()
# ------------------------------------------------------------------
def drizzle_sql_execute_proc (db_name,sql_file):
	args = ["drizzle","-hlocalhost","-uscott",db_name]
	fp_in = open (sql_file,"r")
	result = Popen(args,stdin=fp_in,stdout=PIPE).stdout.readlines()
	fp_in.close ()
#	
# ------------------------------------------------------------------
def dict_to_drizzle_proc (db_name,dict_aa):
	sql_tmp = "/tmp/tmp0042389.sql"
#
	dict_to_sql_proc (sql_tmp,dict_aa)
#
	drizzle_sql_execute_proc (db_name,sql_tmp)
#	
	os.remove (sql_tmp)
#
# ------------------------------------------------------------------
def drizzle_update_proc (db_name,id_in,population_in):
	sql_tmp = "/tmp/tmp0051472.sql"
	fp_out = open (sql_tmp,'w')
	str_out = "use city;\n"
	fp_out.write (str_out)
	today = datetime.datetime.now ()
	str_out = "update cities set POPULATION = '%d',"  % population_in
	str_out += "DATE_MOD = '%s'" % today
	str_out += (" where ID = '%s';" % id_in) + "\n"
	fp_out.write (str_out)
	fp_out.close ()
#
	drizzle_sql_execute_proc (db_name,sql_tmp)
#
	os.remove (sql_tmp)
#
# ------------------------------------------------------------------
def drizzle_delete_proc (db_name,id_in):
	sql_tmp = "/tmp/tmp0064875.sql"
	fp_out = open (sql_tmp,'w')
	str_out = "use city;\n"
	fp_out.write (str_out)
	str_out = ("delete from cities where ID = '%s';" % id_in) + "\n"
	fp_out.write (str_out)
	fp_out.close ()
#
	drizzle_sql_execute_proc (db_name,sql_tmp)
#
	os.remove (sql_tmp)
# ------------------------------------------------------------------
