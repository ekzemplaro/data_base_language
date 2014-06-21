#! /usr/bin/ruby
#
#	couch_ruby_delete.rb
#
#					Jun/20/2014
#
require	"cgi"
require	"json"
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** couch_ruby_delete.rb ****<br />"
#
url_collection = 'http://localhost:5984/nagano'
#
hhh = parse_parameter()
#
hhh.each do |unit|
	key_in = unit
	print key_in,"<br />" 
	url_target = url_collection + '/' + key_in
	json_str = RestClient.get url_target
	unit_aa=JSON.parse(json_str)
	if (unit_aa.key?('_rev'))
		puts unit_aa['name']
		url_del =  url_target + '?rev=' + unit_aa['_rev']
		RestClient.delete url_del
	end
end
#
print "*** couch_ruby_delete.rb *** end ****<p />"
#
