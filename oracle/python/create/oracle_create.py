#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	oracle_create.py
#
#					Aug/07/2015
#
# --------------------------------------------------------
import	sys
import	datetime
import	cx_Oracle
import	string
import	locale
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,table_insert_proc,sql_insert_proc, \
		create_table_proc,drop_table_proc
#
from text_manipulate import dict_append_proc
# --------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t0131','函館',59176,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t0132','札幌',47935,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0133','帯広',21354,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0134','釧路',83672,'2003-2-9')
	dict_aa = dict_append_proc (dict_aa,'t0135','旭川',42391,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0136','北見',35187,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0137','室蘭',81246,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0138','根室',24784,'2003-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0139','稚内',75823,'2003-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
locale.setlocale(locale.LC_ALL,('ja_JP','utf-8'))
locale.setlocale(locale.LC_TIME,('en_US','utf-8'))
dict_aa = data_prepare_proc ()
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = user + "/" + password + "@" + host + ":1521/xe"
conn = cx_Oracle.connect (str_connect)

#
cursor = conn.cursor ()
#
#
drop_table_proc (cursor)
create_table_proc (cursor)
#
#table_insert_proc (cursor,dict_aa)
#
for key in dict_aa:
	unit = dict_aa[key]
	name = unit['name']
	population = unit['population']
	date_mod = unit['date_mod']
	ddx = datetime.datetime.strptime(date_mod, '%Y-%m-%d')
	dd_oracle = ddx.strftime('%d-%b-%Y')
	print (key,name,population,date_mod,dd_oracle)
	ft_aa="insert into cities (id,name,population,date_mod) values ("
#
	ft_bb ="'%s','%s',%d,'%s')" % (key,'Hakodate',population,dd_oracle)
#	ft_bb ="'%s','%s',%d,'%s')" % (key,'函館',population,dd_oracle)
	print (ft_bb)
	sql_str=ft_aa + ft_bb
	print (sql_str)
	cursor.execute (sql_str)
#	sql_insert_proc	(cursor,key,name,population,date_mod)
#
#
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
