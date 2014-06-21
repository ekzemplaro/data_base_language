#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	cdb_ruby_create.rb
#
#					Mar/26/2013
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cdb_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t2381',"豊中",42900,"2006-7-15")
	dict_aa=dict_append_proc(dict_aa,'t2382',"池田",95800,"2006-3-27")
	dict_aa=dict_append_proc(dict_aa,'t2383',"高槻",51200,"2006-8-8")
	dict_aa=dict_append_proc(dict_aa,'t2384',"吹田",32700,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,'t2385',"茨木",18600,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t2386',"摂津",27500,"2006-4-17")
	dict_aa=dict_append_proc(dict_aa,'t2387',"泉大津",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t2388',"和泉",57100,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t2389',"高石",74600,"2006-11-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
file_cdb = "/var/tmp/cdb/cities.cdb"
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
#
cdb_write_proc(file_cdb,dict_aa)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
