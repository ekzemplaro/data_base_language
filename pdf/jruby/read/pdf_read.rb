#! /usr/bin/jruby
#
#	read/pdf_read.rb
#
#					Jun/29/2012
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/pdf_manipulate.rb'
# ---------------------------------------------------------------------
file_pdf = ARGV[0]
puts "*** 開始 ***"
#
dict_aa = pdf_to_dict_proc(file_pdf)
dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# ---------------------------------------------------------------------
