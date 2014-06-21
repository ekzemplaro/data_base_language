#! /usr/bin/ruby
#
#	redis_ruby_update.rb
#
#					Jun/13/2013
#
require 'rubygems'
require	"cgi"
require	"json"
require	"redis"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** redis_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
redis = Redis.new(:host => "host_dbase", :port => 6379)
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	redis_update_proc(redis,id,population)
end
#
#
print "*** end ***<p />"
