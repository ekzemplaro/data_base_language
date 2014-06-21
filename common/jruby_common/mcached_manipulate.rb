# -*- encoding: utf-8 -*-
#
#	jruby_common/mcached_manipulate.rb
#
#					Aug/20/2013
#
require 'json'
#
# ---------------------------------------------------------------------
def mcached_read_proc (ss,key_in)
	ss.puts "get " + key_in
	rec_0 = ss.gets
#	print rec_0
#	print rec_0[0 .. 2]
	if (rec_0[0 .. 2] != "END") then
		rec_1 = ss.gets
		rec_2 = ss.gets
#		print rec_1
		hhh=JSON.parse(rec_1)
		print key_in,"\t"
		print hhh["name"],"\t"
		print hhh["population"],"\t"
		print hhh["date_mod"],"\n"
	end
#
end
# ---------------------------------------------------------------------
def mcached_update_proc (ss,key_in,population_in)
	ss.puts "get " + key_in
	rec_0 = ss.gets
	if (rec_0[0 .. 2] != "END") then
		rec_1 = ss.gets
		rec_2 = ss.gets
#
		unit=JSON.parse(rec_1)
		print key_in,"\t"
		print unit["name"],"\t"
		print unit["population"],"\t"
		print unit["date_mod"],"\n"
		unit['population'] = population_in
		unit['date_mod'] = Date.today
		json_str=JSON(unit)
		print json_str
#
		mcache_set_proc(ss,key_in,json_str)
	end
end

# ---------------------------------------------------------------------
def mcache_set_proc (ss,key_in,json_str)
	llx = json_str.length	
	command = "set " + key_in + (" 0 0 %d" % llx) + "\r\n"
      	print command
#
	ss.puts command
	ss.puts json_str + "\r\n"
	rr = ss.gets
	print rr
end
# ---------------------------------------------------------------------
