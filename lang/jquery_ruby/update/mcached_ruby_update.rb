#! /usr/bin/ruby
#
#	mcached_ruby_update.rb
#
#					Jun/13/2011
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** tcbn_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
cache = MemCache.new 'localhost:11211'
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	mcache_update_proc(cache,id,population)
end
#
#
print "*** end ***<p />"
