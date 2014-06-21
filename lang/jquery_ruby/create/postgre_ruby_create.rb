#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	postgre_ruby_create.rb
#
#					Jul/09/2011
# -------------------------------------------------------------
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# -------------------------------------------------------------
def data_prepare_proc ()
dict_aa={}
dict_aa0=dict_append_proc(dict_aa,'t3461',"広島",41900,"2006-9-23")
dict_aa1=dict_append_proc(dict_aa,'t3462',"福山",28400,"2006-8-12")
dict_aa2=dict_append_proc(dict_aa,'t3463',"東広島",52400,"2006-5-8")
dict_aa3=dict_append_proc(dict_aa,'t3464',"呉",72500,"2006-1-15")
dict_aa4=dict_append_proc(dict_aa,'t3465',"尾道",87100,"2006-5-21")
dict_aa5=dict_append_proc(dict_aa,'t3466',"竹原",25100,"2006-8-2")
dict_aa6=dict_append_proc(dict_aa,'t3467',"三次",42600,"2006-4-7")
dict_aa7=dict_append_proc(dict_aa,'t3468',"大竹",54100,"2006-8-25")
dict_aa8=dict_append_proc(dict_aa,'t3469',"府中",74200,"2006-11-19")
return dict_aa
end
# -------------------------------------------------------------
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
#
#
puts "Content-type: text/html\n\n"
#
dict_aa=data_prepare_proc()
#
sss = Sql_manipulate.new
sss.drop_proc(dbi)
sss.create_proc(dbi)
#
dict_aa.each {|key,value|
#
	sss.insert_proc(dbi,key,value["name"],value["population"],value["date_mod"])
	}
#
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
