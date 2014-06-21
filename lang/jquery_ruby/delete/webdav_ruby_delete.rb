#! /usr/bin/ruby
#
#	webdav_ruby_delete.rb
#
#					Mar/18/2013
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
print "*** webdav_ruby_delete.rb ****<br />"
#
url_target = 'http://cddn007:3004/city/tokyo.json'
json_str = RestClient.get url_target
dict_aa=JSON.parse(json_str)
#
hhh = parse_parameter()
print "*** eeee ****<br />"
hhh.each do |unit|
	id_in = unit
	dict_aa=dict_delete_proc(dict_aa,id_in)
	print id_in,"<br />" 
end
#
json_new=JSON.pretty_generate(dict_aa)
#
RestClient.put url_target, json_new
#
print "*** webdav_ruby_delete.rb *** end ****<p />"
