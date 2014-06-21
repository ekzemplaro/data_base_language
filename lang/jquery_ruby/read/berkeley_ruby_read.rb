#! /usr/bin/ruby1.8
#
#	read/berkeley_read_ruby.rb
#
#					Mar/22/2013
#
require 'bdb'
require	'json'
#
db_file="/var/tmp/berkeley/cities.db"
#
ee = BDB::Btree::open(db_file,"table1","r",0777)
ww=ee.to_hash;
ee.close
#
puts "Content-type: text/json\n\n"
#
str_out="{"
ww.sort.each {|key,value|
#	print (key,value)
	llx=value.length
	str_aa=value[1,llx]
	out_str = "\"" + key + "\": {" + str_aa + ","
	str_out += out_str
	}
llx=str_out.length
json_str=str_out[0,llx-1] + "}"
puts json_str
#
#
#
