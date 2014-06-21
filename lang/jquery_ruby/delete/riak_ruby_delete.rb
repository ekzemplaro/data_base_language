#! /usr/bin/ruby
#
#	riak_ruby_delete.rb
#
#					Mar/13/2013
#
require	"cgi"
require	"json"
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** riak_ruby_delete.rb ****<br />"
#
url_base = 'http://localhost:8098/riak/shimane'
url_in = url_base + '?keys=true'
json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)
#
print "*** dddd Mar/13/2013 ****<br />"
#
hhh = parse_parameter()
print "*** eeee ****<br />"
hhh.each do |unit|
	key_in = unit
	if (data_aa['keys'].include?(key_in))
		url_target = url_base + '/' + key_in
		RestClient.delete url_target
	end
	print key_in,"<br />" 
end
#
#
print "*** riak_ruby_delete.rb *** end ****<p />"
