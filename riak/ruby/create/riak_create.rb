#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	riak_create.rb
#
#					Feb/24/2015
#
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,'t3251',"松江",51843,"2006-8-25")
dict_aa=dict_append_proc(dict_aa,'t3252',"出雲",25789,"2006-6-24")
dict_aa=dict_append_proc(dict_aa,'t3253',"大田",47251,"2006-10-8")
dict_aa=dict_append_proc(dict_aa,'t3254',"雲南",78623,"2006-1-22")
dict_aa=dict_append_proc(dict_aa,'t3255',"江津",51489,"2006-5-11")
dict_aa=dict_append_proc(dict_aa,'t3256',"浜田",27815,"2006-4-17")
dict_aa=dict_append_proc(dict_aa,'t3257',"益田",36572,"2006-9-18")
dict_aa=dict_append_proc(dict_aa,'t3258',"安来",79326,"2006-8-12")

end
# ---------------------------------------------------------------------
#
puts "*** 開始 ***"
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
#
dict_aa=prepare_data_proc()
#
dict_aa.each {|key, value|
	json_str = JSON.generate(value)
	url_city = url_base + '/' + key
	RestClient.put url_city, json_str
}
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
