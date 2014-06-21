#! /usr/bin/ruby
#
#	cassandra_manipulate.rb
#
#					Jun/19/2013
require 'rubygems'
require	"date"
require 'cassandra'
include Cassandra::Constants
#
# --------------------------------------------------------------------
def cassandra_update_proc (cities,key,population_in)
	unit_aa = cities.get(:Akita, key)
#
	unit_aa["population"] = population_in
	population = {'population' => population_in.to_s}
	date_mod_new = Date.today.to_s
	date_mod = {'date_mod' => date_mod_new}
	cities.insert(:Akita, key, population)
	cities.insert(:Akita, key, date_mod)
	print "*** update ***\t",key,"\t", unit_aa["name"],"\t"
	print unit_aa["population"],"\t", unit_aa["date_mod"] , "\n"
#
end
# --------------------------------------------------------------------
def cassandra_delete_proc (cities,key)
	cities.remove(:Akita, key)
#
end
# --------------------------------------------------------------------
def cassandra_display_proc (cities)
keys=["t0531","t0532","t0533",
	"t0534","t0535","t0536",
	"t0537","t0538","t0539"]
for key in keys
#	unit_aa = cities.get(:Akita, key)
	unit_aa = cities.get(:cities, key)
	if (unit_aa["name"] != nil)
		print key,"\t", unit_aa["name"],"\t"
		print unit_aa["population"],"\t", unit_aa["date_mod"]
		puts
	end
end
#
end
# --------------------------------------------------------------------
def cassandra_to_json_proc (cities)
#
keys=["t0531","t0532","t0533",
	"t0534","t0535","t0536",
	"t0537","t0538","t0539"]
	str_out = '{'
#
	for key in keys
		unit_aa = cities.get(:Akita, key)
#
		if (unit_aa["name"] != nil)
			str_out += '"'+key + '": '
			str_out += '{"name": "' + unit_aa["name"].to_s
			str_out += '","population": "' + unit_aa["population"].to_s
			str_out += '","date_mod": "' + unit_aa["date_mod"].to_s + '"}'
			str_out += ','
			end
	end
	llx = str_out.length
#	print "llx=",llx,"\n"
		str_out = str_out[0,llx-1]
		str_out += '}'
	return	str_out
end
#
# --------------------------------------------------------------------
