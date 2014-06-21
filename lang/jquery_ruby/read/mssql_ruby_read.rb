#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	master_ruby_read.rb
#
#					Dec/08/2010
#
# -----------------------------------------------------------------------
#
str_aa='{"cities":[{"id":"921","name":"	横浜","population":"72158","date_mod":"2006-5-17"},'
str_aa += '{"id":"922","name":"川崎","population":"46732","date_mod":"2006-9-8"},'

str_aa += '{"id":"923","name":"小田原","population":"16839","date_mod":"2006-7-17"},'

str_aa += '{"id":"924","name":"藤沢","population":"90948","date_mod":"2006-9-23"},'



str_aa += '{"id":"925","name":"相模原","population":"40345","date_mod":"2006-10-21"}]}'
#
#
puts "Content-type: text/json\n\n"
puts	str_aa
#
