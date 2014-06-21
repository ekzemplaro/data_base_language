#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cassandra_read.rb
#
#					Sep/06/2013
# --------------------------------------------------------------------
require 'cassandra-cql'

#load '/var/www/data_base/common/ruby_common/cassandra_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# --------------------------------------------------------------------
print "*** 開始 ***\n"

dict_aa = {}

db = CassandraCQL::Database.new('127.0.0.1:9160', {:keyspace => 'city'})

db.execute("SELECT key,name,population,date_mod FROM cities").fetch { |row|
	unit_row=row.to_hash
	key=unit_row["key"]
	name=unit_row["\x00\x04name\x00"]
	population=unit_row["\x00\npopulation\x00"]
	date_mod=unit_row["\x00\bdate_mod\x00"]
	dict_aa=dict_append_proc(dict_aa,key,name,population,date_mod)
	}

dict_display_proc(dict_aa)
#
print "*** 終了 ***\n"
#
# --------------------------------------------------------------------
