#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	redis_ruby_read.rb
#
#					Jun/13/2013
# -------------------------------------------------------------
require 'rubygems'
require 'redis'
#
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t1851',"福井",74200,"2006-3-21")
	dict_aa=dict_append_proc(dict_aa,'t1852',"敦賀",29800,"2006-9-27")
	dict_aa=dict_append_proc(dict_aa,'t1853',"小浜",57200,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,'t1854',"大野",32700,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,'t1855',"勝山",64100,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t1856',"鯖江",21500,"2006-4-17")
	dict_aa=dict_append_proc(dict_aa,'t1857',"あわら",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t1858',"越前",52800,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t1859',"坂井",74600,"2006-11-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
puts "Content-type: text/html\n\n"
#
#
dict_aa = prepare_data_proc()
#
redis = Redis.new(:host => "host_dbase", :port => 6379)
#
dict_aa.each {|key, value|
	puts key
	redis.set key,json_gen_proc(value['name'],value['population'],value['date_mod'])
	}
#
#
puts "*** OK ***<br />"
#
# -------------------------------------------------------------
#
