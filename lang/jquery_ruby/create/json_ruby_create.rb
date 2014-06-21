#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	json_ruby_create.rb
#
#					Jun/20/2011
# -------------------------------------------------------------
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
dict_aa ={}
dict_aa0=dict_append_proc(dict_aa,'t0921',"宇都宮",51200,"2006-4-9")
dict_aa1=dict_append_proc(dict_aa,'t0922',"小山",41700,"2006-5-17")
dict_aa2=dict_append_proc(dict_aa,'t0923',"佐野",17500,"2006-3-8")
dict_aa3=dict_append_proc(dict_aa,'t0924',"足利",71600,"2006-6-22")
dict_aa4=dict_append_proc(dict_aa,'t0925',"日光",84900,"2006-10-11")
dict_aa5=dict_append_proc(dict_aa,'t0926',"下野",25100,"2006-4-17")
dict_aa6=dict_append_proc(dict_aa,'t0927',"さくら",31600,"2006-4-18")
dict_aa7=dict_append_proc(dict_aa,'t0928',"矢板",71800,"2006-8-15")
dict_aa8=dict_append_proc(dict_aa,'t0929',"真岡",85300,"2006-10-11")
dict_aa9=dict_append_proc(dict_aa,'t0930',"栃木",41700,"2006-9-12")
dict_aa10=dict_append_proc(dict_aa,'t0931',"大田原",52100,"2006-7-22")
dict_aa11=dict_append_proc(dict_aa,'t0932',"鹿沼",81400,"2006-8-17")
dict_aa12=dict_append_proc(dict_aa,'t0933',"那須塩原",71300,"2006-12-21")
dict_aa13=dict_append_proc(dict_aa,'t0934',"那須烏山",68400,"2006-11-5")

return dict_aa
end
# -------------------------------------------------------------
json_file = "/var/tmp/json/cities.json"
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
json_out = JSON.pretty_generate(dict_aa)
file_write_proc(json_file,json_out)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
