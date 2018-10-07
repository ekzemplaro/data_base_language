#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/delete/elastic_delete.rb
#
#					Oct/07/2018
#
# ---------------------------------------------------------------------
require 'faraday'
#
# ---------------------------------------------------------------------
STDERR.puts	"*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
URL = "http://localhost:9200/cities/tochigi/" + key_in
#
begin
	Faraday.delete URL
rescue => error
	puts error
end
#
STDERR.puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
