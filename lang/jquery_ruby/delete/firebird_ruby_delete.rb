#! /usr/bin/ruby1.8
#
#	firebird_ruby_delete.rb
#
#					Jun/11/2012
#
require 'rubygems'
gem 'fb'
#
require 'fb'
include Fb
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** postgre_ruby_delete.rb ****<br />"
db = Database.new(
	:database => "localhost:/var/tmp/firebird/cities.fdb",
	:username => 'SYSDBA',
	:password => 'tiger',
	:charset => 'UTF-8',
	:role => '',
	:page_size => 8192
	)
#
conn = db.connect rescue db.create.connect
hhh = parse_parameter()
#
#
sss=Sql_manipulate.new
#
hhh.each do |unit|
	id = unit
	sss.delete_proc(conn,id)
	print id,"<br />" 
end
#
conn.close
#
print "*** end ***<p />"
