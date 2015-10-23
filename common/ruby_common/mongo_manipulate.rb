#! /usr/bin/ruby
#
#	mongo_manipulate.rb
#
#					Jun/25/2012
#
require	'rubygems'
require 'date'
require 'mongo'
include Mongo
#
# ---------------------------------------------------------------------
def	mongo_update_proc (coll,id_in,population_in)
#
	date_mod_new = Date.today.to_s
#
	coll.find('id'=> id_in).each { |row|
#		print	row.inspect , "\n"
		row["population"] = population_in
		row["date_mod"] = date_mod_new
		coll.save(row)
		}
#
#
end
# ---------------------------------------------------------------------
def	mongo_delete_proc (coll,id_in)
#
	coll.find('id'=> id_in).each { |row|
#		print	row.inspect , "\n"
		coll.remove(row)
		}
#
#
end
# ---------------------------------------------------------------------
def	mongo_display_proc (coll_in)
	coll_in.find().each { |row|
		print row["id"],
		"\t", row["name"],
		"\t",row["population"],
		"\t",row["date_mod"],"\n"}
end
#
# ---------------------------------------------------------------------
def mongo_to_json_proc (coll_in)
#
	str_out = '{'
#
	coll_in.find().each { |row|
#
		str_out += '"'+row["id"] + '": {'
		str_out += '"name": "'+row["name"]
		str_out += '","population": "' + row["population"].to_s
		str_out += '","date_mod": "' + row["date_mod"].to_s + '"}'
		str_out += ','
	}
	llx = str_out.length
#	print "llx=",llx,"\n"
		str_out = str_out[0,llx-1]
		str_out += '}'
	return	str_out
end
#
# ---------------------------------------------------------------------
def dict_to_mongo_proc (dict_aa)
#
	db_name = 'city_db'
	col_name = 'saitama'
	db   = Connection.new("localhost",27017).db(db_name)
#
	coll = db.collection(col_name)
	coll.remove
#
	dict_aa.each {|key, value|
		coll.insert({'id'=>key,'name' =>value['name'],'population'=>value['population'],'date_mod'=>value['date_mod']})
	}
end
#
# ---------------------------------------------------------------------
