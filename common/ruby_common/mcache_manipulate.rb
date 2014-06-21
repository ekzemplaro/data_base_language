#! /usr/bin/ruby
#
#	mcache_manipulate.rb
#
#						Mar/22/2012
#
require 'rubygems'
require 'memcache'
require 'json'
require 'date'
# ------------------------------------------------------------
def display_record_proc (cache,key)
	key_str=key.to_s
	value=cache[key_str]
#	puts value
	if (value)
		hhh=JSON.parse(value)
		print key_str,"\t"
		print hhh["name"],"\t"
		print hhh["population"],"\t"
		print hhh["date_mod"],"\n"
	end
end
# ------------------------------------------------------------
def mcache_update_proc (cache,id_in,population_in)
	str_json=cache[id_in.to_s]
	puts str_json
	hhh=JSON.parse(str_json)
	json_new = json_gen_proc(hhh["name"],population_in,Date.today)
	cache[id_in.to_s]=json_new
end
# ------------------------------------------------------------
def mcache_to_json_proc (cache,keys)
	str_aa='{'
	keys.each {|key|
		value=cache[key]
		if (value)
			str_aa += "\"" + key + "\": "
			str_aa += value + ","
		end
		}
	llx = str_aa.length
	str_aa = str_aa[0,llx-1]
	str_aa += '}'
#
	return	str_aa
end
# ------------------------------------------------------------
