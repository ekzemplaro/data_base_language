#! /usr/bin/ruby
#
#	cdb_ruby_update.rb
#
#					Mar/27/2013
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cdb_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** text_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
file_cdb = "/var/tmp/cdb/cities.cdb"
#
dict_aa = cdb_read_proc(file_cdb)
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	dict_aa = dict_update_proc(dict_aa,id,population)
end
#
print "*** bbbb bbbb ***<p />"
cdb_write_proc(file_cdb,dict_aa)
#
print "*** end ***<p />"
