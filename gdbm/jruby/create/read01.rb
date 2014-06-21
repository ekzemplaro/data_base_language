#! /usr/bin/ruby
#
require	'dbm'
require	'json'
#
puts "*** start *** read01.rb ***"
#ee=DBM.open("/var/tmp/gdbm/cities.dbm")
ee=DBM.open("/var/tmp/gdbm/cities")
#ee=DBM.open("cities")
puts "-----------------"
ww=ee.to_hash;
ee.close
puts "-----------------"
ww.each {|key,value|
#	print(key,value)
	hhh=JSON.parse(value)
	print key,"\t"
	print hhh["name"],"\t"
	print hhh["population"],"\t"
	print hhh["date_mod"],"\n"
	};
#
puts "-----------------"
puts ww.size
#
puts "*** end ***"
#
