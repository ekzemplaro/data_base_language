#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	master_ruby_read.rb
#
#					Jun/28/2010
#
#
str_aa='{"cities":[{"id":"921","name":"	横浜","population":"90345","date_mod":"2010-03-02"},'
str_aa += '{"id":"922","name":"川崎","population":"15345","date_mod":"2010-01-05"},'

str_aa += '{"id":"923","name":"小田原","population":"16345","date_mod":"2010-01-17"},'

str_aa += '{"id":"924","name":"藤沢","population":"90345","date_mod":"2010-02-09"},'


str_aa += '{"id":"925","name":"相模原","population":"90345","date_mod":"2010-02-22"},'

str_aa += '{"id":"926","name":"厚木","population":"19345","date_mod":"2010-02-14"},'

str_aa += '{"id":"927","name":"鎌倉","population":"10345","date_mod":"2010-01-14"}]}'
#
#
puts "Content-type: text/json\n\n"
puts	str_aa
#
