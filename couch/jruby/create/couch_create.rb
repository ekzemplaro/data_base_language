#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_create.rb
#
#					Aug/20/2013
#
require 'rubygems'
require 'json'
require 'net/http'
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
load '/var/www/data_base/common/jruby_common/couch_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,"t2021","長野",52718,"2007-2-25")
dict_aa=dict_append_proc(dict_aa,"t2022","松本",21357,"2007-7-17")
dict_aa=dict_append_proc(dict_aa,"t2023","上田",47295,"2007-9-8")
dict_aa=dict_append_proc(dict_aa,"t2024","小諸",72613,"2007-1-22")
dict_aa=dict_append_proc(dict_aa,"t2025","岡谷",41739,"2007-5-11")
dict_aa=dict_append_proc(dict_aa,"t2026","塩尻",16915,"2007-4-17")
dict_aa=dict_append_proc(dict_aa,"t2027","茅野",38962,"2007-4-18")
dict_aa=dict_append_proc(dict_aa,"t2028","飯田",75421,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t2029","中野",87923,"2007-10-11")
dict_aa=dict_append_proc(dict_aa,"t2030","諏訪",23917,"2007-9-12")
dict_aa=dict_append_proc(dict_aa,"t2031","駒ヶ根",51348,"2007-7-22")
dict_aa=dict_append_proc(dict_aa,"t2032","佐久",85734,"2007-8-17")
dict_aa=dict_append_proc(dict_aa,"t2033","伊那",79261,"2007-12-29")
dict_aa=dict_append_proc(dict_aa,"t2034","千曲",62153,"2007-11-30")

return dict_aa
end
# ---------------------------------------------------------------------
#
puts "*** 開始 ***"
server = Couch::Server.new("cddn007", "5984")
#
couch_delete_proc (server)
#
dict_aa=prepare_data_proc()
#
json_str = JSON(dict_aa)

server.put("/city/cities",json_str)

res = server.get("/city/cities")
#
str_json = res.body
# --------------------------------------------------------------------------
#
dict_aa=JSON.parse(str_json)
#
dict_display_proc(dict_aa)
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
