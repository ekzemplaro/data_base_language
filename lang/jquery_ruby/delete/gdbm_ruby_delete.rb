#! /usr/bin/ruby
#
#	gdbm_ruby_delete.rb
#
#					Jun/13/2011
#
require	"cgi"
require	"json"
require	"dbm"
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** gdbm_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
ee=DBM.open("/var/tmp/gdbm/cities")
#
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
