#! /usr/bin/ruby
#
#	mcache_manipulate.rb
#
#						Feb/26/2015
#
require 'dalli'
require 'json'
require 'date'
# ------------------------------------------------------------
def display_record_proc(dc,key)
	key_str=key.to_s
	value=dc.get(key_str)
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
def mcache_update_proc (dc,key_in,population_in)
	str_json=dc.get(key_in)
	puts str_json
	hhh=JSON.parse(str_json)
	json_new = json_gen_proc(hhh["name"],population_in,Date.today)
	dc.set(key_in,json_new)
end
# ------------------------------------------------------------
def mcache_to_json_proc (dc,keys)
	str_aa='{'
	keys.each {|key|
		value=dc.get(key)
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
