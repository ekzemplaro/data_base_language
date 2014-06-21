#! /usr/bin/ruby
#
#	ruby_common/redis_manipulate.rb
#
#				Jun/20/2011
#
require 'date'
require 'json'
#
# -------------------------------------------------------------
def redis_update_proc (redis,key,population)
	str_json = redis.get key
#	puts str_json
	hhh=JSON.parse(str_json)
	data_out = {}
	data_out["name"] = hhh["name"]
	data_out["population"] = population.to_s
	data_out["date_mod"] = Date.today.to_s
	str_out = JSON.generate(data_out)
	redis.set key,str_out
end
# -------------------------------------------------------------
def redis_display_proc (redis)
#
	redis.keys.each {|key|
		value = redis.get key
		if (value != nil) then
			hhh=JSON.parse(value)
			print key,"\t"
			print hhh["name"],"\t"
			print hhh["population"],"\t"
			print hhh["date_mod"],"\n"
		end
			
	}
end
# -------------------------------------------------------------
def redis_to_dict_proc (redis)
	dict_aa = {}

	keys=["t1851","t1852","t1853","t1854",
		"t1855","t1856","t1857","t1858","t1859"]

	keys.each {|key|
		value = redis.get key
		if (value != nil) then
			unit=JSON.parse(value)
			dict_aa[key]=unit
		end
	}
#
	return	dict_aa
end
# -------------------------------------------------------------
