#! /usr/bin/ruby
#
#	gdbm_ruby_update.rb
#
#					Jun/13/2011
#
require	"cgi"
require	"dbm"
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** gdbm_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
ee=DBM.open("/var/tmp/gdbm/cities")
#
print "*** cccc ***<p />"
#
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	print "*** dddd ***<p />"
	kvalue_update_proc(ee,id,population)
	print "*** eeee ***<p />"
end
print "*** ffff ***<p />"
#
ee.close
#
print "*** end ***<p />"
