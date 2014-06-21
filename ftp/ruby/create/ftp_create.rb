#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ftp_create.rb
#
#					Feb/25/2013
#
require 'rubygems'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
#
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,"t0361","盛岡",31587,"2006-11-12")
dict_aa=dict_append_proc(dict_aa,"t0362","久慈",23864,"2006-8-21")
dict_aa=dict_append_proc(dict_aa,"t0363","二戸",45917,"2006-4-8")
dict_aa=dict_append_proc(dict_aa,"t0364","宮古",78623,"2006-2-22")
dict_aa=dict_append_proc(dict_aa,"t0365","遠野",41589,"2006-5-11")
dict_aa=dict_append_proc(dict_aa,"t0366","八幡平",25915,"2006-9-17")
dict_aa=dict_append_proc(dict_aa,"t0367","大船渡",36972,"2006-8-18")
dict_aa=dict_append_proc(dict_aa,"t0368","一関",73921,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,"t0369","花巻",86123,"2006-10-21")


end
# ---------------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa=prepare_data_proc()
#
json_str = JSON.pretty_generate(dict_aa)
#
host='host_dbase'
user='scott'
pass='tiger'
target_file='city/iwate.json'
ftp_put_proc(host,user,pass,target_file,json_str)
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
