#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	ftp_ruby_delete.rb
#
#					Jun/20/2014
#
require	"cgi"
require	"json"
require	"net/ftp"
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** ftp_ruby_delete.rb ****<br />"
#
host='cddn007'
user='scott'
pass='tiger'
target_file='city/iwate.json'
#
json_str = ftp_get_proc(host,user,pass,target_file)
#
print "*** ccc ****<br />"
print json_str
dict_aa=JSON.parse(json_str)
#
print "*** dddd Sep/12/2011 ****<br />"
#
hhh = parse_parameter()
print "*** eeee ****<br />"
hhh.each do |unit|
	id_in = unit
	dict_aa=dict_delete_proc(dict_aa,id_in)
	print id_in,"<br />" 
end
#
print "*** fff ****<br />"
#
json_new=JSON.pretty_generate(dict_aa)
#
ftp_put_proc(host,user,pass,target_file,json_new)
#
print "*** couch_ruby_delete.rb *** end ****<p />"
