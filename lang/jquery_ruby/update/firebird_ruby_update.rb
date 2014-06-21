#! /usr/bin/ruby1.8
#
#	firebird_ruby_update.rb
#
#					Jun/11/2012
#
require 'rubygems'
gem 'fb'
#
require 'fb'
include Fb
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** firebird_ruby_update.rb ****<br />"
print "*** firebird_ruby_update.rb **** aaa<br />"
#
db = Database.new(
	:database => "localhost:/var/tmp/firebird/cities.fdb",
	:username => 'SYSDBA',
	:password => 'tiger',
	:charset => 'UTF-8',
	:role => '',
	:page_size => 8192
	)
#
print "*** firebird_ruby_update.rb **** ppp<br />"
conn = db.connect rescue db.create.connect
#
hhh = parse_parameter()
#
sss=Sql_manipulate.new
print "*** firebird_ruby_update.rb **** qqqq<br />"
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	sss.update_proc(conn,id,population)
	print id,population,"<br />" 
end
#
conn.close
#
print "*** end ***<p />"
