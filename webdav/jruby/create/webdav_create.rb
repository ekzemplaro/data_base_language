#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	webdav_create.rb
#
#					Aug/20/2013
#
require 'rubygems'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,"t1351","八王子",74392,"2007-9-19")
dict_aa=dict_append_proc(dict_aa,"t1352","立川",23716,"2007-2-27")
dict_aa=dict_append_proc(dict_aa,"t1353","武蔵野",81945,"2007-2-8")
dict_aa=dict_append_proc(dict_aa,"t1354","三鷹",78623,"2007-1-22")
dict_aa=dict_append_proc(dict_aa,"t1355","青梅",41789,"2007-5-11")
dict_aa=dict_append_proc(dict_aa,"t1356","府中",15928,"2007-9-17")
dict_aa=dict_append_proc(dict_aa,"t1357","昭島",36972,"2007-8-18")
dict_aa=dict_append_proc(dict_aa,"t1358","調布",71924,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t1359","町田",86523,"2007-10-21")


end
# ---------------------------------------------------------------------
puts "*** 開始 ***"
#
server = Couch::Server.new("host_dbase", "3004")
#
dict_aa=prepare_data_proc()
#
#json_str = JSON.pretty_generate(dict_aa)
json_str = JSON(dict_aa)

server.put("/city/tokyo.json",json_str)

#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
