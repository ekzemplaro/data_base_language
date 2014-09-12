#! /usr/bin/ruby
#
#	sqlite3_ruby_update.rb
#
#					Sep/11/2014
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** sqlite3_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
db = SQLite3::Database.new("/var/tmp/sqlite3/cities.db")
#
sss=Sql_manipulate.new
#
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	sss.update_proc(db,id,population)
end
#
print "*** end ***<p />"
