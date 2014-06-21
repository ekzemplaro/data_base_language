#! /usr/bin/ruby
#
#	master_ruby_update.rb
#
#					Apr/13/2010
#
require	"cgi"
require	"json"
#
load '/var/www/uchida/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/uchida/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** master_ruby_update.rb ****<br />"
hhh = parse_parameter()
hhh.each do |unit|
	print "id: " + unit["id"].to_s + " ___ "
	print "population: " + unit["population"].to_s + "<br />"
end
#
print "*** end ***<p />"
