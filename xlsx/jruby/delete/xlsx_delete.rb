#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	xlsx_delete.rb
#					Dec/15/2014
#
# --------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/xlsx_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
xlsx_file=ARGV[0]
key = ARGV[1]
#
puts key
#
dict_aa = xlsx_read_proc(xlsx_file)

if (dict_aa.key?(key))
	dict_aa = dict_delete_proc(dict_aa,key)
	xlsx_write_proc(xlsx_file,dict_aa)
end

puts "*** 終了 ***"
# --------------------------------------------------------
