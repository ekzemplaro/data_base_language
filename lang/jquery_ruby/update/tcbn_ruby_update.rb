#! /usr/bin/ruby
#
#	tcbn_ruby_update.rb
#
#					Jun/13/2011
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** tcbn_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
file_in = "/var/tmp/tokyo_cabinet/cities.tcb"
#
bdb = BDB::new

if !bdb.open(file_in, BDB::OWRITER | BDB::OCREAT)
	print "*** tcbn_ruby_update.rb ****error<br />"
	ecode = bdb.ecode
	STDERR.printf("open error: %s\n", bdb.errmsg(ecode))
end
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	tcbn_update_proc(bdb,id,population)
end
#
#
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
print "*** end ***<p />"
