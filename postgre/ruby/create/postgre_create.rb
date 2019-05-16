#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/postgre_create.rb
#
#					May/14/2019
# ---------------------------------------------------------------------
require 'pg'
require 'dotenv'
#
# ---------------------------------------------------------------------
def dict_append_proc (dict_aa,id,name,population,date_mod)
	unit = {}
	unit['name'] = name
	unit['population'] = population
	unit['date_mod'] = date_mod
	key = id.to_s
	dict_aa[key] = unit
	return dict_aa
end
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,'t3461',"広島",83162,"2006-3-12")
dict_aa=dict_append_proc(dict_aa,'t3462',"福山",97385,"2006-4-27")
dict_aa=dict_append_proc(dict_aa,'t3463',"東広島",58724,"2006-5-8")
dict_aa=dict_append_proc(dict_aa,'t3464',"呉",25914,"2006-1-15")
dict_aa=dict_append_proc(dict_aa,'t3465',"尾道",84721,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,'t3466',"竹原",21853,"2006-4-7")
dict_aa=dict_append_proc(dict_aa,'t3467',"三次",42637,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,'t3468',"大竹",53129,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,'t3469',"府中",71956,"2006-12-21")
return dict_aa
end
# ---------------------------------------------------------------------
def	create_proc (connection)
sql_str="create TABLE cities (" \
	+ "id varchar(10) NOT NULL PRIMARY KEY," \
	+ "name varchar(20)," \
	+ "population int," \
	+ "date_mod varchar(40))"
	puts sql_str
	connection.exec(sql_str)
end
# ------------------------------------------------------------
def	drop_proc (connection)
	sql_str="drop table cities"
	puts sql_str
	connection.exec(sql_str)
end
# ---------------------------------------------------------------------
def	insert_proc (connection,id,name,population,date_mod)
	sql_str="INSERT into cities " \
		+ "(id, Name, Population, date_mod) values \
		('#{id}', '#{name}',#{population},'#{date_mod}')"
#	puts sql_str
	connection.exec(sql_str)
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
Dotenv.load
user = ENV['user']
password = ENV['password']
data_base = ENV['data_base']
#
connection = PG::connect(:host => "localhost",
	:user =>user, :password =>password, :dbname =>data_base)
#
#
dict_aa=prepare_data_proc()
#
drop_proc(connection)
create_proc(connection)
#
dict_aa.each {|key,value |
	insert_proc(connection,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
connection.finish
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
