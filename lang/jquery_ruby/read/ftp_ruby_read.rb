#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ftp_ruby_read.rb
#
#					Feb/25/2013
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

require 'rubygems'
require 'open-uri'
# -------------------------------------------------------------
url='ftp://scott:tiger@cddn007/city/iwate.json'
response= open(url,:proxy=>nil)
str_json=response.read
#
puts "Content-type: text/json\n\n"
#
#
puts	str_json
#
# -------------------------------------------------------------
