#! /usr/bin/ruby
#
#	couch_manipulate.rb
#
#					Feb/01/2011
#
require 'json'
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_module.rb'
# --------------------------------------------------------------------------
def couch_update_proc (url_target,id_in,population)
#	res = server_aa.get(key_str)
	json_str = RestClient.get url_target
#
	hhh=JSON.parse(json_str)
#
	hash_update_proc(hhh,id_in,population)
	json_new=JSON.pretty_generate(hhh)
#	server_aa.put(key_str,json_new)
	RestClient.put url_target, json_new
#
end
#
# --------------------------------------------------------------------------
def couch_delete_proc (server_aa,key_str,id_in)
	puts "*** couch_delete_proc ***"
	res = server_aa.get(key_str)
	json_str = res.body
	hhh=JSON.parse(json_str)
	puts "_rev= " + hhh["_rev"]
#
	hhh2=hash_delete_proc(hhh,id_in)
	hhh2["_rev"]=hhh["_rev"]
	json_new=JSON.pretty_generate(hhh2)
	server_aa.put(key_str,json_new)
end
#
# --------------------------------------------------------------------------
def couch_delete_multi_proc (url_target,arry_ids)
	print "*** couch_delete_multi_proc *** start ***<br />"
	json_str = RestClient.get url_target
#
	hhh=JSON.parse(json_str)
	rev_aaa = hhh["_rev"]
	puts "_rev= " + hhh["_rev"]
#
	for it in 0 .. (arry_ids.size - 1) do
		idx=arry_ids[it]
		print idx,"*** couch_delete_multi_proc *** <br />"
		hhh=hash_delete_proc(hhh,idx)
		print "*** hhh['cities'].size = ",hhh['cities'].size, "<br />"
	end
	hhh["_rev"]=rev_aaa
#
	print "bbbb ***  _rev= " , hhh["_rev"], "<br />"
	json_new=JSON.pretty_generate(hhh)
	res = RestClient.put url_target, json_new
#
	print "res = ",res
end
#
# --------------------------------------------------------------------------
def couch_display_proc (server_aa,key_str)
	res = server_aa.get(key_str)
	json_str = res.body
#
	json_display_proc(json_str)
end
# --------------------------------------------------------------------------
def couch_drop_proc (url_host)
	url_docs = url_host + "/city/_all_docs"
	str_json = RestClient.get url_docs
	list_aa=JSON.parse(str_json)
	puts "*** check bbbbb ***"
	puts list_aa["total_rows"]
	puts list_aa["offset"]
#
	url_target = url_host + '/city/cities'
	list_aa["rows"].each do |row|
		if (row["id"] == "cities") then 
			puts row["id"] + "\t" + row["value"]["rev"]
			url_aa = url_target + "?rev=" + row["value"]["rev"]
			res = RestClient.delete url_aa
		end
	end
end
# --------------------------------------------------------------------------

