#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	mysql_ruby_create.rb
#
#					Jan/20/2011
# -------------------------------------------------------------
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,"t3321","岡山",79600,"2006-9-28")
dict_aa=dict_append_proc(dict_aa,"t3322","倉敷",82700,"2006-10-17")
dict_aa=dict_append_proc(dict_aa,"t3323","津山",62800,"2006-9-8")
dict_aa=dict_append_proc(dict_aa,"t3324","玉野",32500,"2006-3-15")
dict_aa=dict_append_proc(dict_aa,"t3325","笠岡",84100,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,"t3326","井原",58100,"2006-4-7")
dict_aa=dict_append_proc(dict_aa,"t3327","総社",69200,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,"t3328","高梁",21500,"2006-9-12")
dict_aa=dict_append_proc(dict_aa,"t3329","新見",74100,"2006-12-4")
return dict_aa
end
# -------------------------------------------------------------
dbi=DBI.connect("dbi:Mysql:city:host_mysql","scott","tiger")
#
mysql_utf8_proc(dbi)
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
sss = Sql_manipulate.new
sss.drop_proc(dbi)
sss.create_proc(dbi)
#
dict_aa.each {|key,value|
#
	sss.insert_proc(dbi,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
