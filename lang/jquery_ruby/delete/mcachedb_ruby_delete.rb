#! /usr/bin/ruby
#
#	mcachedb_ruby_delete.rb
#
#					Jun/13/2011
#
require	"cgi"
require	"memcache"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** mcachedb_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
cache = MemCache.new 'localhost:21201'
#
hhh.each do |unit|
	id = unit
	cache.delete(id.to_s)
end
#
#
print "*** mcachedb_ruby_delete.rb *** end ***<p />"
