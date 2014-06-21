#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	pdf_delete.rb
#
#					Jul/15/2013
#
# ---------------------------------------------------------------------
require	'rubygems'
require	'hpdf'
require	'kconv'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/pdf_manipulate.rb'
# ---------------------------------------------------------------------
file_pdf = ARGV[0]
puts "*** 開始 ***"
#
id_in = ARGV[1]
#
puts id_in
#
dict_aa = pdf_to_dict_proc(file_pdf)
dict_aa = dict_delete_proc(dict_aa,id_in)
dict_display_proc(dict_aa)
dict_to_pdf_proc(file_pdf,dict_aa)
#
puts "*** 終了 ***"
# ---------------------------------------------------------------------
