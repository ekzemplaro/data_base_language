#! /usr/bin/ruby1.8
# -*- encoding: utf-8 -*-
#
#	firebird_ruby_create.rb
#
#					Mar/22/2013
# -------------------------------------------------------------
require 'rubygems'
gem 'fb'
#
require 'fb'
include Fb
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# -------------------------------------------------------------
def data_prepare_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,'t3821',"松山",73100,"2006-8-24")
dict_aa=dict_append_proc(dict_aa,'t3822',"今治",83600,"2006-4-27")
dict_aa=dict_append_proc(dict_aa,'t3823',"宇和島",62400,"2006-5-8")
dict_aa=dict_append_proc(dict_aa,'t3824',"八幡浜",25100,"2006-12-15")
dict_aa=dict_append_proc(dict_aa,'t3825',"新居浜",84700,"2006-5-21")
dict_aa=dict_append_proc(dict_aa,'t3826',"西条",21900,"2006-9-7")
dict_aa=dict_append_proc(dict_aa,'t3827',"大洲",42800,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,'t3828',"伊予",58700,"2006-10-12")
dict_aa=dict_append_proc(dict_aa,'t3829',"西予",74500,"2006-6-9")
return dict_aa
end
# -------------------------------------------------------------
db = Database.new(
	:database => "localhost:/var/tmp/firebird/cities.fdb",
	:username => 'sysdba',
	:password => 'tiger',
	:charset => 'UTF-8',
	:role => '',
	:page_size => 8192
	)
#
conn = db.connect rescue db.create.connect
#
#
puts "Content-type: text/html\n\n"
#
dict_aa=data_prepare_proc()
#
sss = Sql_manipulate.new
sss.drop_proc(conn)
sss.create_proc(conn)
#
dict_aa.each {|key,value|
#
	sss.insert_proc(conn,key,value["name"],value["population"],value["date_mod"])
	}
#
conn.close
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
