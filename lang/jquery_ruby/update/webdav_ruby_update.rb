#! /usr/bin/ruby
#
#	webdav_ruby_update.rb
#
#					Mar/18/2013
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
print "*** webdav_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
#
url_target = 'http://cddn007:3004/city/tokyo.json'
#
json_str = RestClient.get url_target
dict_aa=JSON.parse(json_str)
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	dict_aa=dict_update_proc(dict_aa,id,population)
	print id,population,"<br />" 
end
#
json_new=JSON.pretty_generate(dict_aa)
#
RestClient.put url_target, json_new
#
print "*** end ***<p />"
