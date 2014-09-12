#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mysql_read_ruby.rb
#
#					Sep/11/2014
#
# --------------------------------------------------------------
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/sql_to_json.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
#
#
dbi=DBI.connect("dbi:Mysql:city:host_mysql","scott","tiger")
#
mysql_utf8_proc (dbi)
#
str_out = sql_to_json_proc(dbi)
#
puts "Content-type: text/json\n\n"
puts str_out
#
