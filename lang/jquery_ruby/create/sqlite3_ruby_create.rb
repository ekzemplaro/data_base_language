#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	sqlite3_ruby_create.rb
#
#					Jul/09/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# -------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
dict_aa=dict_append_proc(dict_aa,"t0711","郡山",41900,"2006-5-12")
dict_aa=dict_append_proc(dict_aa,"t0712","会津若松",72600,"2006-4-21")
dict_aa=dict_append_proc(dict_aa,"t0713","白河",72800,"2006-5-8")
dict_aa=dict_append_proc(dict_aa,"t0714","福島",24500,"2006-1-15")
dict_aa=dict_append_proc(dict_aa,"t0715","喜多方",84100,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,"t0716","二本松",21300,"2006-4-7")
dict_aa=dict_append_proc(dict_aa,"t0717","いわき",42900,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,"t0718","相馬",54100,"2006-9-15")
dict_aa=dict_append_proc(dict_aa,"t0719","須賀川",97400,"2006-10-11")
return dict_aa
end
# -------------------------------------------------------------
file_sqlite3 = "/var/tmp/sqlite3/cities.db"
db = SQLite3::Database.new(file_sqlite3)
#
puts "Content-type: text/html\n\n"
#
dict_aa=data_prepare_proc()
#
sss = Sql_manipulate.new
sss.drop_proc(db)
sss.create_proc(db)
#
dict_aa.each {|key,value|
#
	sss.insert_proc(db,key,value["name"],value["population"],value["date_mod"])
	}
#
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
