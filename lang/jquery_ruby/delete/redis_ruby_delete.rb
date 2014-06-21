#! /usr/bin/ruby
#
#	redis_ruby_delete.rb
#
#					Jun/13/2013
#
require 'rubygems'
require 'redis'
require	"cgi"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** redis_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
redis = Redis.new(:host => "host_dbase", :port => 6379)
#
hhh.each do |unit|
	id = unit
	redis.del id
end
#
#
print "*** end ***<p />"
