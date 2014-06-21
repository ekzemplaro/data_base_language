#! /usr/bin/ruby1.8
# -*- coding: utf-8 -*-
#
#	mongo_delete.rb
#
#					Mar/18/2013
#
require	'rubygems'
#require 'date'
require 'mongo'
include Mongo
#
load '/var/www/data_base/common/ruby_common/mongo_manipulate.rb'
# ---------------------------------------------------------------------
print "*** 開始 ***\n"
id_in = ARGV[0]
#
puts id_in
#
db_name = 'city_db'
col_name = 'saitama'
db = Connection.new("localhost",27017).db(db_name)
#
coll = db.collection(col_name)
#
print "coll.count = ",coll.count(),"\n"
#
mongo_delete_proc(coll,id_in)
#
mongo_display_proc (coll)
#
print "coll.count = ",coll.count(),"\n"
print "*** 終了 ***\n"
# ---------------------------------------------------------------------
