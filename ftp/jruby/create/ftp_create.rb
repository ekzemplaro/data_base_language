#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	ftp_create.rb
#
#					Sep/03/2015
#
require 'rubygems'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,"t0361","盛岡",79192,"2007-8-19")
dict_aa=dict_append_proc(dict_aa,"t0362","久慈",21786,"2007-2-27")
dict_aa=dict_append_proc(dict_aa,"t0363","二戸",47285,"2007-6-8")
dict_aa=dict_append_proc(dict_aa,"t0364","宮古",78923,"2007-1-22")
dict_aa=dict_append_proc(dict_aa,"t0365","遠野",51489,"2007-5-11")
dict_aa=dict_append_proc(dict_aa,"t0366","八幡平",72915,"2007-9-17")
dict_aa=dict_append_proc(dict_aa,"t0367","大船渡",36972,"2007-8-18")
dict_aa=dict_append_proc(dict_aa,"t0368","一関",74921,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t0369","花巻",86523,"2007-10-21")


end
# ---------------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa=prepare_data_proc()
#
#json_str = JSON.pretty_generate(dict_aa)
json_str = JSON(dict_aa)

host='host_dbase'
user='scott'
pass='tiger'
target_file='city/iwate.json'
ftp_put_proc(host,user,pass,target_file,json_str)
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
