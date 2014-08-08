#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_create.py
#
#					Jul/29/2014
#
# --------------------------------------------------------
import	sys
import	postgresql
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t3461','広島',25176,'2003-9-24')
	dict_aa = dict_append_proc (dict_aa,'t3462','福山',47935,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t3463','東広島',28654,'2003-2-8')
	dict_aa = dict_append_proc (dict_aa,'t3464','呉',83152,'2003-10-9')
	dict_aa = dict_append_proc (dict_aa,'t3465','尾道',42791,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t3466','竹原',35687,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t3467','三次',81296,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t3468','大竹',21764,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t3469','府中',75423,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
#
dict_aa = data_prepare_proc ()
#
db = postgresql.open("pq://scott:tiger@localhost/city")
ps = db.prepare("drop table cities")
print (ps ())
#
sql_str="create table cities (id varchar(10), name varchar(20)," \
		+ " population int, date_mod date)"
ps = db.prepare(sql_str)
print (ps ())
#
for key in dict_aa:
	unit = dict_aa[key]
	ft_aa="insert into cities (id,name,population,date_mod) values ("
	ft_bb ="'%s','%s',%d,'%s')" % (key,unit['name'], \
		unit['population'],unit['date_mod'])
	sql_str=ft_aa + ft_bb
	ps = db.prepare(sql_str)
	print (ps ())
#
#
#
ps.close ()
db.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
