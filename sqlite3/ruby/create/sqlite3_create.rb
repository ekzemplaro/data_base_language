#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/sqlite3_create.rb
#
#					May/10/2013
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,'t0711',"郡山",41963,"2006-3-17")
dict_aa=dict_append_proc(dict_aa,'t0712',"会津若松",25178,"2006-4-27")
dict_aa=dict_append_proc(dict_aa,'t0713',"白河",72894,"2006-5-8")
dict_aa=dict_append_proc(dict_aa,'t0714',"福島",25148,"2006-1-15")
dict_aa=dict_append_proc(dict_aa,'t0715',"喜多方",84765,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,'t0716',"二本松",21583,"2006-4-7")
dict_aa=dict_append_proc(dict_aa,'t0717',"いわき",42619,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,'t0718',"相馬",54127,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,'t0719',"須賀川",93621,"2006-10-11")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
file_sqlite3 = ARGV[0]
dbi = SQLite3::Database.new(file_sqlite3)
#
dict_aa=prepare_data_proc()
#
sss = Sql_manipulate.new
sss.drop_proc(dbi)
sss.create_proc(dbi)
#
dict_aa.each {|key,value |
	sss.insert_proc(dbi,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
