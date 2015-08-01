#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	xlsx_update.rb
#					Jul/20/2015
#
# --------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/xlsx_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
xlsx_file=ARGV[0]
key = ARGV[1]
population_in = ARGV[2].to_i
puts key,population_in
#
dict_aa = xlsx_read_proc(xlsx_file)

if (dict_aa.key?(key))
	dict_aa[key]["population"] = population_in
	dict_aa[key]["date_mod"] = Date.today.to_s
	xlsx_write_proc(xlsx_file,dict_aa)
end
#
puts "*** 終了 ***"
# --------------------------------------------------------
