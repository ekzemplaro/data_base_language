#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ftp_ruby_create.rb
#
#					Feb/25/2013
# -------------------------------------------------------------
require 'json'
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa = dict_append_proc(dict_aa,"t0361","盛岡",41800,"2006-5-9")
dict_aa = dict_append_proc(dict_aa,"t0362","久慈",75900,"2006-3-17")
dict_aa = dict_append_proc(dict_aa,"t0363","二戸",47200,"2006-2-8")
dict_aa = dict_append_proc(dict_aa,"t0364","宮古",73600,"2006-1-22")
dict_aa = dict_append_proc(dict_aa,"t0365","遠野",81400,"2006-5-11")
dict_aa = dict_append_proc(dict_aa,"t0366","八幡平",15900,"2006-4-17")
dict_aa = dict_append_proc(dict_aa,"t0367","大船渡",36900,"2006-4-18")
dict_aa = dict_append_proc(dict_aa,"t0368","一関",74200,"2006-8-15")
dict_aa = dict_append_proc(dict_aa,"t0369","花巻",17900,"2006-10-11")

return dict_aa
end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
json_str = JSON.pretty_generate(dict_aa)
#
host='cddn007'
user='scott'
pass='tiger'
target_file='city/iwate.json'
ftp_put_proc(host,user,pass,target_file,json_str)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
