#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/maria_create.rb
#
#					Apr/07/2017
# ---------------------------------------------------------------------
require 'mysql'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa = {}
dict_aa=dict_append_proc(dict_aa,'t3321',"岡山",729138,"2006-9-14")
dict_aa=dict_append_proc(dict_aa,'t3322',"倉敷",318475,"2006-2-27")
dict_aa=dict_append_proc(dict_aa,'t3323',"津山",182564,"2006-8-8")
dict_aa=dict_append_proc(dict_aa,'t3324',"玉野",572148,"2006-11-15")
dict_aa=dict_append_proc(dict_aa,'t3325',"笠岡",893157,"2006-7-21")
dict_aa=dict_append_proc(dict_aa,'t3326',"井原",167589,"2006-9-7")
dict_aa=dict_append_proc(dict_aa,'t3327',"総社",241937,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,'t3328',"高梁",438129,"2006-10-12")
dict_aa=dict_append_proc(dict_aa,'t3329',"新見",519472,"2006-6-9")
	return	dict_aa
end
# ---------------------------------------------------------------------
def	create_proc (connection)
	sql_str="create TABLE cities (" \
		+ "id varchar(10) NOT NULL PRIMARY KEY," \
		+ "name varchar(20)," \
		+ "population int," \
		+ "date_mod varchar(40))"
	connection.query(sql_str)
end
# ------------------------------------------------------------
def	drop_proc (connection)
	sql_str="drop table cities"
	connection.query(sql_str)
end
# ---------------------------------------------------------------------
def	insert_proc (connection,id,name,population,date_mod)
	sql_str="INSERT into cities " \
		+ "(id, Name, Population, date_mod) values \
		('#{id}', '#{name}',#{population},'#{date_mod}')"
	connection.query(sql_str)
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
host = "127.0.0.1"
user = "scott"
password = "tiger123"
data_base = 'city'
connection = Mysql::new(host, user,password,data_base)
#
dict_aa=prepare_data_proc()
#
drop_proc(connection)
create_proc(connection)
dict_aa.each {|key,value |
	insert_proc(connection,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
connection.close
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
