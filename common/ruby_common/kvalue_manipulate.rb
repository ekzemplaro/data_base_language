#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	kvalue_manipulate.rb
#
#				Aug/18/2010
#
require	'dbm'
require	'date'
require	'json'
#
# --------------------------------------------------------------------
def kvalue_update_proc (ww_in,id_in,population_in)
	print "*** kvalue_update_proc ***\t"
	print id_in,"\t",population_in,"\n"
	json_str=ww_in[id_in.to_s]
	puts json_str
	hhh=JSON.parse(json_str)
	hhh['population']=population_in
	hhh['date_mod']=Date.today
	print "\t",hhh['name'],"\t",hhh['population'],"\n"
#	json_new=JSON.pretty_generate(hhh)
	json_new=JSON.generate(hhh)
	print	json_new,"\n"
	ww_in[id_in.to_s]=json_new
end
# --------------------------------------------------------------------
def kvalue_delete_proc (ww_in,id_in)
	print "*** kvalue_delete_proc ***\t"
	print id_in,"\n"
	ww_in.delete(id_in.to_s)
end
# --------------------------------------------------------------------
def kvalue_display_proc (ww_in)
	ww_in.sort.each {|key,value|
		hhh=JSON.parse(value)
		print key,"\t"
		print hhh["name"],"\t"
		print hhh["population"],"\t"
		print hhh["date_mod"],"\n"
		};
end
# --------------------------------------------------------------------
