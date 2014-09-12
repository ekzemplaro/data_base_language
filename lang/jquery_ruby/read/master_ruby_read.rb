#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	master_ruby_read.rb
#
#					Jun/07/2011
#
# -----------------------------------------------------------------------
#
str_aa='{"t0421":{"name":"仙台","population":"91728","date_mod":"2006-3-12"},'
str_aa += '"t0422":{"name":"石巻","population":"15467","date_mod":"2006-9-8"},'

str_aa += '"t0423":{"name":"塩竈","population":"16839","date_mod":"2006-7-17"},'

str_aa += '"t0424":{"name":"気仙沼","population":"51748","date_mod":"2006-9-23"},'


str_aa += '"t0425":{"name":"白石","population":"71564","date_mod":"2006-4-22"},'

str_aa += '"t0426":{"name":"名取","population":"29347","date_mod":"2006-5-17"},'
str_aa += '"t0427":{"name":"多賀城","population":"59346","date_mod":"2006-8-15"},'
str_aa += '"t0428":{"name":"岩沼","population":"69142","date_mod":"2006-9-12"},'

str_aa += '"t0429":{"name":"大崎","population":"41273","date_mod":"2006-10-24"}}'
#
#
puts "Content-type: text/json\n\n"
puts	str_aa
#
