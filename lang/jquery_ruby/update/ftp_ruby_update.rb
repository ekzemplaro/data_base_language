#! /usr/bin/ruby
#
#	ftp_ruby_update.rb
#
#					Feb/25/2013
#
require 'net/ftp'
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** ftp_ruby_update.rb *** start ***<br />"
hhh = parse_parameter()
#
host='cddn007'
user='scott'
pass='tiger'
target_file='city/iwate.json'
#
json_str = ftp_get_proc(host,user,pass,target_file)
#
dict_aa=JSON.parse(json_str)
#
print "*** ddd Sep/10/2011 ****<br />"
#
hhh.each do |unit|
	id = unit["id"]
print "*** eeee ****<br />"
	population=unit["population"].to_i
	dict_aa=dict_update_proc(dict_aa,id,population)
	print id,population,"<br />" 
end
#
print "*** fff ****<br />"
json_new=JSON.pretty_generate(dict_aa)
print "*** gggg ****<br />"
#
ftp_put_proc(host,user,pass,target_file,json_new)
#
print "*** end ***<p />"
