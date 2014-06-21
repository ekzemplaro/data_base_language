#! /usr/bin/ruby1.8
# -*- encoding: utf-8 -*-
#
#	firebird_ruby_read.rb
#
#					Mar/22/2013
#
# -----------------------------------------------------------------------
#
require 'rubygems'
gem 'fb'
#
require 'fb'
include Fb
#
#load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
#
#load '/var/www/data_base/common/ruby_common/sql_to_json.rb'
#
# -----------------------------------------------------------------------
def sql_to_json_firebird_proc (dbi)
#
table = dbi.execute('select * from cities order by ID')
#
#
str_out = '{'
#
it = 0
table.each {|row|
#
	str_out += '"' + row[0].to_s + '": '
	str_out += '{"name": "'+row[1]
	str_out += '","population": "' + row[2].to_s
	str_out += '","date_mod": "' + row[3].to_s + '"}'
	str_out += ','
#	if (it != (table.length - 1)) then
#		str_out += ','
#	else
#		str_out += '}'
#	end
	it += 1
}

llx = str_out.length

str_out[llx-1] = "}"
return	str_out
end

# -----------------------------------------------------------------------
#
db = Database.new(
	:database => "localhost:/var/tmp/firebird/cities.fdb",
	:username => 'sysdba',
	:password => 'tiger',
	:charset => 'UTF-8',
	:role => '',
	:page_size => 8192
	)
#
dbi = db.connect rescue db.create.connect
#
#
str_out = sql_to_json_firebird_proc(dbi)
dbi.close
#
puts "Content-type: text/json\n\n"
puts str_out
# -----------------------------------------------------------------------
#
