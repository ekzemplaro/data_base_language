#! /usr/bin/ruby
#
#	couch_ruby_update.rb
#
#					Jun/20/2014
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
print "*** couch_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
url_collection = 'http://localhost:5984/nagano'
#
hhh.each do |unit|
	key = unit["id"]
	population=unit["population"].to_i
	print key,population,"<br />"
	url_target = url_collection + '/' + key
	json_str = RestClient.get url_target
	unit_aa=JSON.parse(json_str)
	unit_aa['population'] = population
	unit_aa['date_mod'] = Date.today
	json_new=JSON.generate(unit_aa)
	RestClient.put url_target, json_new
end
#
print "*** end ***<p />"
