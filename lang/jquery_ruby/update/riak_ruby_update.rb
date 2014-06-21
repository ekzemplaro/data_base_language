#! /usr/bin/ruby
#
#	riak_ruby_update.rb
#
#					Mar/13/2013
#
require 'date'
require	"cgi"
require	"json"
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** riak_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
url_base = 'http://localhost:8098/riak/shimane'
url_in = url_base + '?keys=true'
json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)
#
print "*** ddd Mar/13/2013 ****<br />"
#
hhh.each do |unit|
	print "*** eee Mar/13/2013 ****<br />"
	key_in = unit["id"]
	population=unit["population"].to_i
	if (data_aa['keys'].include?(key_in))
		print "*** fff Mar/13/2013 ****<br />"
		print key_in
		url_target = url_base + '/' + key_in
		json_city = RestClient.get url_target
		city = JSON.parse(json_city)
		city['population'] = population
		city['date_mod'] = Date.today
		json_out = JSON.generate(city)
		print "*** ggg Mar/13/2013 ****<br />"
		RestClient.put url_target, json_out
	end
	print key_in,population,"<br />" 
end
#
#
print "*** end ***<p />"
