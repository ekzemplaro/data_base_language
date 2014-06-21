#! /usr/bin/ruby1.8
#
#	postgre_ruby_update.rb
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
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** postgre_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
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
