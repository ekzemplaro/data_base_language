#! /usr/bin/ruby
#
#	read/gdm_read_ruby.rb
#
#					Apr/09/2010
#
require 'dbm'
require	'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
#load '/var/www/data_base/common/ruby_common/xml_to_json.rb'
#
#
ee=DBM.open("/var/tmp/gdbm/cities")
ww=ee.to_hash;
ee.close
#
puts "Content-type: text/json\n\n"
#
str_out='{'
ww.sort.each {|key,value|
#	print (key,value)
	llx=value.length
	str_aa=value[1,llx]
	out_str = '"' + key + '": {' + str_aa + ','
	str_out += out_str
	}
llx=str_out.length
json_str=str_out[0,llx-1] + '}'
puts json_str
#
#
#
#
#
