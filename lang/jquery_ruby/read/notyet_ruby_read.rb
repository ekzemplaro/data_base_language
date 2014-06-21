#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	notyet_ruby_read.rb
#
#					Jan/26/2011
#
# -----------------------------------------------------------------------
#
str_aa='{"t0921": {"name":" 横浜","population":"90721","date_mod":"2006-5-17"},'
str_aa += '"t0922": {"name":"川崎","population":"15467","date_mod":"2006-9-8"},'

str_aa += '"t0923": {"name":"小田原","population":"16839","date_mod":"2006-7-17"},'

str_aa += '"t0924": {"name":"藤沢","population":"90948","date_mod":"2006-9-23"},'


str_aa += '"t0925": {"name":"相模原","population":"71564","date_mod":"2006-4-22"},'

str_aa += '"t0926": {"name":"厚木","population":"29347","date_mod":"2006-5-17"},'
str_aa += '"t0927": {"name":"横須賀","population":"59346","date_mod":"2006-8-15"},'
str_aa += '"t0928": {"name":"鎌倉","population":"69842","date_mod":"2006-9-12"},'

str_aa += '"t0929": {"name":"逗子","population":"40345","date_mod":"2006-10-21"}}'
#
#
puts "Content-type: text/json\n\n"
puts	str_aa
#
