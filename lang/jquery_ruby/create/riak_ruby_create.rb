#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	riak_ruby_create.rb
#
#					Mar/13/2013
# -------------------------------------------------------------
require 'json'
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,'t3251',"松江",52300,"2006-4-25")
dict_aa=dict_append_proc(dict_aa,'t3252',"出雲",81700,"2006-6-4")
dict_aa=dict_append_proc(dict_aa,'t3253',"大田",47200,"2006-11-8")
dict_aa=dict_append_proc(dict_aa,'t3254',"雲南",78600,"2006-5-22")
dict_aa=dict_append_proc(dict_aa,'t3255',"江津",91500,"2006-9-15")
dict_aa=dict_append_proc(dict_aa,'t3256',"浜田",29800,"2006-3-17")
dict_aa=dict_append_proc(dict_aa,'t3257',"益田",36500,"2006-7-18")
dict_aa=dict_append_proc(dict_aa,'t3258',"安来",74300,"2006-8-12")

return dict_aa
end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
#
url_base = 'http://localhost:8098/riak/shimane'
#
dict_aa=prepare_data_proc()
#
dict_aa.each {|key, value|
	json_str = JSON.generate(value)
	url_city = url_base + '/' + key
	RestClient.put url_city, json_str
}
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
