#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mongo_create.rb
#					Sep/11/2015
#
# --------------------------------------------------------
include Java

import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection

import org.bson.Document

load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# --------------------------------------------------------
def mongo_create_proc (coll,key_in,name_in,population_in,date_mod_in)

doc = Document.new("key",key_in).append("name",name_in).append("population",population_in).append("date_mod",date_mod_in)

	coll.insertOne (doc)
end
# --------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t1161","さいたま",74126,"2007-8-12")
	dict_aa=dict_append_proc(dict_aa,"t1162","所沢",36819,"2007-1-27")
	dict_aa=dict_append_proc(dict_aa,"t1163","越谷",58472,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t1164","久喜",21965,"2007-9-21")
	dict_aa=dict_append_proc(dict_aa,"t1165","熊谷",84137,"2007-12-24")
	dict_aa=dict_append_proc(dict_aa,"t1166","秩父",27589,"2007-6-17")
	dict_aa=dict_append_proc(dict_aa,"t1167","川越",41693,"2007-4-28")
	dict_aa=dict_append_proc(dict_aa,"t1168","和光",52197,"2007-5-12")
	dict_aa=dict_append_proc(dict_aa,"t1169","新座",83526,"2007-11-21")
#
	return	dict_aa
end
# --------------------------------------------------------
puts	"*** 開始 ***"
#
dict_aa = prepare_data_proc()
#
mm = MongoClient.new("localhost",27017)
db = mm.getDatabase("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)

puts coll.count()

coll.drop()

dict_aa.each {|key, value|
	mongo_create_proc(coll,key,value['name'],value['population'],value['date_mod'])
}

puts "*** 終了 ***"

# --------------------------------------------------------
