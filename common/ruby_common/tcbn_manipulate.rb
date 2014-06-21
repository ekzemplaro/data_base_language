#! /usr/bin/ruby
#
#	ruby_common/tcbn_manipulate.rb
#
#				Jun/08/2011
#
require 'date'
require 'json'
require 'tokyocabinet'
include TokyoCabinet
#
# -------------------------------------------------------------
def tcbn_update_proc (bdb,id,population)
	key=id.to_s
	str_json = bdb.get(key)
#	puts str_json
	hhh=JSON.parse(str_json)
	data_out = {}
	data_out["name"] = hhh["name"]
	data_out["population"] = population.to_s
	data_out["date_mod"] = Date.today.to_s
	str_out = JSON.generate(data_out)
#	puts str_out
	bdb.put(key,str_out)
end
# -------------------------------------------------------------
def tcbn_display_proc (bdb)
	bdb.each do |key, value|
		hhh=JSON.parse(value)
		print key,"\t"
		print hhh["name"],"\t"
		print hhh["population"],"\t"
		print hhh["date_mod"],"\n"
	end
end
# -------------------------------------------------------------
def tcbn_to_json_proc (bdb)
	ary=[]
	bdb.each do |key, value|
		hhh=JSON.parse(value)
#		hhh["id"]=key
#		str_out = JSON.generate(hhh)
		str_out = '"' + key + '":' + value
		ary << str_out
	end
#
	str_aa='{'
for it in 0..(ary.size - 1) do
	str_aa += ary[it]
	if (it != (ary.size - 1)) then
		str_aa += ','
	else
		str_aa += '}'
	end
end
	return	str_aa
end
# -------------------------------------------------------------
