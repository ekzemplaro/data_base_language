#! /usr/bin/ruby
#
#	tyrant_ruby_delete.rb
#
#					Jun/22/2012
#
require	"cgi"
require	"memcache"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** tyrant_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
cache = MemCache.new 'localhost:1978'
#
hhh.each do |unit|
	id = unit
	cache.delete(id.to_s)
end
#
#
print "*** end ***<p />"
