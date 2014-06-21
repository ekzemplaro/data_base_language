#! /usr/bin/ruby1.8
#
#	berkeley_ruby_delete.rb
#
#					Mar/22/2013
#
require	"cgi"
require	"json"
require	"bdb"
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** berkeley_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
db_file = "/var/tmp/berkeley/cities.db"
#
ee = BDB::Btree::open(db_file,"table1","r+",0777)
#
hhh.each do |unit|
	id = unit
	kvalue_delete_proc(ee,id)
	print "*** eeee ***<p />"
end
print "*** ffff ***<p />"
#
ee.close
#
print "*** end ***<p />"
