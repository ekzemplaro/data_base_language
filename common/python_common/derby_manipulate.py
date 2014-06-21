# -*- coding: utf-8 -*-
#
#	derby_manipulate.py
#
#						Jul/06/2012
#
import	os
from subprocess import Popen, PIPE
import	shlex
import	string
import	datetime
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
#
from text_manipulate import dict_append_proc
from text_manipulate import text_write_proc
# ------------------------------------------------------------------
def derby_sql_execute_proc (sql_file):
	args = ["/usr/share/javadb/bin/ij",sql_file]
#	os.system ("/usr/share/javadb/bin/ij " + sql_file)
	result = Popen(args,stdout=PIPE).stdout.readlines()
#
	return	result	
# ------------------------------------------------------------------
def derby_to_dict_proc (db_name):
	dict_aa = {}
#
	sql_tmp = "/tmp/tmp0012875.sql"
	fp_out = open (sql_tmp,'w')
	str_out = "connect 'jdbc:derby://localhost:1527/" + db_name + "';"
	fp_out.write (str_out)
	str_out = "select id,name,population,date_mod from cities;"
	fp_out.write (str_out)
	str_out = "quit;"
	fp_out.write (str_out)
	fp_out.close ()
#
	result = derby_sql_execute_proc (sql_tmp)
#
	os.remove (sql_tmp)
#
	for str in result:
		line = str.rstrip()
		if (5 < len (line)):
			cols= string.split (line)
			if (cols[0][0] == "t"):
				name = cols[1][1:]
				population = string.atoi (cols[2][1:])
				date_mod = (cols[3][1:])
				dict_aa = dict_append_proc (dict_aa,cols[0], \
					name,population,date_mod)
#
	return	dict_aa
# ------------------------------------------------------------------
def dict_to_derby_sql_proc (sql_tmp,db_name,dict_aa):
	fp_out = open (sql_tmp,'w')
	str_out = "connect 'jdbc:derby://localhost:1527/" + db_name + "';"
	fp_out.write ( str_out)
	str_out = "drop table cities;\n"
	fp_out.write ( str_out)
	str_out = "create table cities (id varchar(10) primary key, name varchar(20), population int, date_mod date);\n"
	fp_out.write ( str_out)
	str_out = "commit;\n"
	fp_out.write ( str_out)
#
	for key in sorted (dict_aa.keys()):
		unit = dict_aa[key]
		name = unit['name']
		population = unit['population']
		date_mod = unit['date_mod']
		str_out = "insert into cities (id,name,population,date_mod) values ('"
		str_out += key + "','"
		str_out += name + "',"
		str_out += ("%d" % population) + ",'"
		str_out += date_mod + "');\n"
		fp_out.write ( str_out)
#
	str_out = "commit;\n"
	fp_out.write ( str_out)
	str_out = "quit;\n"
	fp_out.write ( str_out)
	fp_out.close ()
# ------------------------------------------------------------------
def dict_to_derby_proc (db_name,dict_aa):
	sql_tmp = "/tmp/tmp0054286.sql"
#
	dict_to_derby_sql_proc (sql_tmp,db_name,dict_aa)
#
	derby_sql_execute_proc (sql_tmp)
#	
	os.remove (sql_tmp)
#
# ------------------------------------------------------------------
def derby_update_proc (db_name,id_in,population_in):
	sql_tmp = "/tmp/tmp0058472.sql"
	fp_out = open (sql_tmp,'w')
	str_out = "connect 'jdbc:derby://localhost:1527/" + db_name + "';"
	fp_out.write (str_out)
	today = datetime.datetime.now ()
	str_out = "update cities set POPULATION = %d,"  % population_in
	str_out += "DATE_MOD = '%s'" % today
	str_out += (" where ID = '%s';" % id_in) + "\n"
	fp_out.write (str_out)
	fp_out.close ()
#
	derby_sql_execute_proc (sql_tmp)
#
	os.remove (sql_tmp)
#
# ------------------------------------------------------------------
def derby_delete_proc (db_name,id_in):
	sql_tmp = "/tmp/tmp0078154.sql"
	fp_out = open (sql_tmp,'w')
	str_out = "connect 'jdbc:derby://localhost:1527/" + db_name + "';"
	fp_out.write (str_out)
	str_out = ("delete from cities where ID = '%s';" % id_in) + "\n"
	fp_out.write (str_out)
	fp_out.close ()
#
	derby_sql_execute_proc (sql_tmp)
#
	os.remove (sql_tmp)
#
# ------------------------------------------------------------------
