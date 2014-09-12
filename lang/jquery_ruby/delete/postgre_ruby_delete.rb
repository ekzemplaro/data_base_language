#! /usr/bin/ruby
#
#	postgre_ruby_delete.rb
#
#					Sep/11/2014
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
print "*** postgre_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
#
#
sss=Sql_manipulate.new
#
hhh.each do |unit|
	id = unit
	sss.delete_proc(dbi,id)
	print id,"<br />" 
end
#
#
print "*** end ***<p />"
