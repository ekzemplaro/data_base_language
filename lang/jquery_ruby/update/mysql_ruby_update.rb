#! /usr/bin/ruby1.8
#
#	mysql_ruby_update.rb
#
#					Jul/17/2011
#
require	"dbi"
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** mysql_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
dbi=DBI.connect("dbi:Mysql:city:host_mysql","scott","tiger")
#
mysql_utf8_proc(dbi)
#
sss=Sql_manipulate.new
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	sss.update_proc(dbi,id,population)
	print id,population,"<br />" 
end
#
#
print "*** end ***<p />"
