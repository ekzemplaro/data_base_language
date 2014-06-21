#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	read/webdav_read_ruby.rb
#
#					Mar/18/2013
#
# -------------------------------------------------------------
#
require	'restclient'
#
str_json= RestClient.get 'http://cddn007:3004/city/tokyo.json'
#
puts "Content-type: text/json\n\n"
puts str_json
#
#
# -------------------------------------------------------------
