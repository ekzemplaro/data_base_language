#! /usr/bin/ruby
#
#	mysql_ruby_delete.rb
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
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** mysql_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
dbi=DBI.connect("dbi:Mysql:city:host_mysql","scott","tiger")
#
mysql_utf8_proc(dbi)
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
