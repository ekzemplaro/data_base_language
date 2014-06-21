#! /usr/bin/ruby1.8
#
#	berkeley_ruby_update.rb
#
#					Mar/22/2013
#
require	"cgi"
require	"bdb"
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** berkeley_ruby_update.rb ****<br />"
hhh = parse_parameter()
print "*** berkeley_ruby_update.rb **** bbbb<br />"
#
db_file = "/var/tmp/berkeley/cities.db"
ee = BDB::Btree::open(db_file,"table1","r+",0777)
#
print "*** cccc ***<p />"
#
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	print "*** berkeley dddd ***<p />"
	kvalue_update_proc(ee,id,population)
	print "*** eeee ***<p />"
end
print "*** ffff ***<p />"
#
ee.close
#
print "*** end ***<p />"
