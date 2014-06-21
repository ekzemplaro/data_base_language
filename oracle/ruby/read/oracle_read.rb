#! /usr/bin/ruby
#
#	oracle_read.rb
#
#					May/31/2011
#
# --------------------------------------------------------------------
require 'rubygems'
require 'oci8'
#
puts 	"*** 開始 ***"
#
dbi=OCI8.new('scott', 'tiger', '//spn109:1521/xe')
#
cur = dbi.exec('select * from cities')
#
while	row = cur.fetch
	puts row.join("\t")
end
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------
