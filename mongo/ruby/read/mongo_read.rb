#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	read/mongo_read.rb
#
#					May/12/2015
#
require 'rubygems'
require 'mongo'
include Mongo
#
load '/var/www/data_base/common/ruby_common/mongo_manipulate.rb'
# ---------------------------------------------------------------------
#
print "*** 開始 ***\n"
db_name = 'city_db'
col_name = 'saitama'
db   = Connection.new("localhost",27017).db(db_name)
#
coll = db.collection(col_name)
#
print "col.count = ",coll.count(),"\n"
#
mongo_display_proc (coll)
#
print "*** 終了 ***\n"
# ---------------------------------------------------------------------
