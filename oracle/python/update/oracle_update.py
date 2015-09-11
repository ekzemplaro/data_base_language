#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_update.py
#
#					Aug/07/2015
#
#	to_date ('2009/7/23 16:20:15','YYYY/MM/DD HH24:MI:SS')
# --------------------------------------------------------
import	sys
import	cx_Oracle
import	string
from time import localtime,strftime
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_update_proc
#
# --------------------------------------------------------
def	oracle_sql_update_string_gen_proc	(id_in,ipop_in):
#	date_mod = datetime.datetime.strftime ("%d-%b-%Y",localtime ())
	date_mod = strftime ("%d-%b-%Y",localtime ())
	ft_aa=u"update cities set population = %d, " % ipop_in
	ft_bb=u"date_mod='%s' " % date_mod
	ft_cc=u"where id = '%s'" % id_in
	sql_str=ft_aa + ft_bb + ft_cc
	print (sql_str)
#
	return	sql_str
# --------------------------------------------------------
def	oracle_sql_update_proc	(cursor_aa,id_in,ipop_in):
#
	sql_str = oracle_sql_update_string_gen_proc      (id_in,ipop_in)
	cursor_aa.execute (sql_str)
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = user + "/" + password + "@" + host + ":1521/xe"
conn = cx_Oracle.connect (str_connect)
#
cursor = conn.cursor ()
#
oracle_sql_update_proc	(cursor,id_in,population_in)
conn.commit ()
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
