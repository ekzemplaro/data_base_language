#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	calc_read.rb
#
#					Dec/09/2014
#
# ---------------------------------------------------------------------
require 'roo'
#
# ---------------------------------------------------------------------
file_calc = ARGV[0]
puts	"*** 開始 ***"
ss = Roo::OpenOffice.new(file_calc)
ss.default_sheet = ss.sheets.first
#
#
for it in ss.first_row .. ss.last_row do
	str_out = ss.cell(it,'B').to_s + "\t"
	str_out += ss.cell(it,'D').to_s + "\t"
	str_out += ss.cell(it,'F').to_s + "\t"
	str_out += ss.cell(it,'H').to_s
	puts str_out
end
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
