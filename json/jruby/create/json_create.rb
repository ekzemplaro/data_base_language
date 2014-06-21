#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	jruby/create/json_create.rb
#
#					Jan/18/2012
#
require 'rubygems'
require 'json'
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa = {}
dict_aa=dict_append_proc(dict_aa,"t0921","宇都宮",92184,"2007-2-15")
dict_aa=dict_append_proc(dict_aa,"t0922","小山",49817,"2007-7-17")
dict_aa=dict_append_proc(dict_aa,"t0923","佐野",14725,"2007-2-8")
dict_aa=dict_append_proc(dict_aa,"t0924","足利",27628,"2007-1-22")
dict_aa=dict_append_proc(dict_aa,"t0925","日光",84189,"2007-5-11")
dict_aa=dict_append_proc(dict_aa,"t0926","下野",21516,"2007-4-17")
dict_aa=dict_append_proc(dict_aa,"t0927","さくら",31927,"2007-4-18")
dict_aa=dict_append_proc(dict_aa,"t0928","矢板",71923,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t0929","真岡",85925,"2007-10-11")
dict_aa=dict_append_proc(dict_aa,"t0930","栃木",41512,"2007-9-12")
dict_aa=dict_append_proc(dict_aa,"t0931","大田原",57541,"2007-7-22")
dict_aa=dict_append_proc(dict_aa,"t0932","鹿沼",81658,"2007-8-17")
dict_aa=dict_append_proc(dict_aa,"t0933","那須塩原",72547,"2007-12-29")
dict_aa=dict_append_proc(dict_aa,"t0934","那須烏山",64816,"2007-11-30")

return dict_aa

end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
json_file = ARGV[0]
#
dict_aa=prepare_data_proc()
#
#dict_display_proc(dict_aa)
#
json_str=JSON(dict_aa)
#puts json_str
#
file_write_proc(json_file,json_str)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
