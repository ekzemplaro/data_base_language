#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/json_create.rb
#
#					Feb/14/2011
#
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa = {}
dict_aa=dict_append_proc(dict_aa,"t0921","宇都宮",53921,"2006-2-15")
dict_aa=dict_append_proc(dict_aa,"t0922","小山",49174,"2006-7-17")
dict_aa=dict_append_proc(dict_aa,"t0923","佐野",14725,"2006-2-8")
dict_aa=dict_append_proc(dict_aa,"t0924","足利",27658,"2006-1-22")
dict_aa=dict_append_proc(dict_aa,"t0925","日光",87429,"2006-5-11")
dict_aa=dict_append_proc(dict_aa,"t0926","下野",25916,"2006-4-17")
dict_aa=dict_append_proc(dict_aa,"t0927","さくら",36927,"2006-4-18")
dict_aa=dict_append_proc(dict_aa,"t0928","矢板",71923,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,"t0929","真岡",83925,"2006-10-11")
dict_aa=dict_append_proc(dict_aa,"t0930","栃木",45126,"2006-9-12")
dict_aa=dict_append_proc(dict_aa,"t0931","大田原",58762,"2006-7-22")
dict_aa=dict_append_proc(dict_aa,"t0932","鹿沼",81394,"2006-8-17")
dict_aa=dict_append_proc(dict_aa,"t0933","那須塩原",72547,"2006-12-29")
dict_aa=dict_append_proc(dict_aa,"t0934","那須烏山",64816,"2006-11-30")

return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
json_file = ARGV[0]
#
dict_aa=prepare_data_proc()
#
dict_display_proc(dict_aa)
#
json_out = JSON.pretty_generate(dict_aa)
file_write_proc(json_file,json_out)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
