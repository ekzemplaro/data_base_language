#! /usr/bin/ruby
#
#	ruby_common/sql_manipuate.rb
#
#				Sep/17/2013
#
require 'sqlite3'
require 'date'
#
class Sql_manipulate
# ------------------------------------------------------------
def	disp_proc (db)
table = db.execute('select * from cities order by ID')
#
table.each {|row|
	print "#{row[0]}\t#{row[1]}\t#{row[2]}\t#{row[3]}\n"}
end
#
# ------------------------------------------------------------
def	update_proc (dbi,id,population)
date_mod=Date.today
#date_mod=Time.now
#puts date_mod
sql_str="UPDATE cities SET population='#{population}', DATE_MOD='#{date_mod}' where ID = '#{id}'"
puts sql_str
dbi.execute(sql_str)
end
# ------------------------------------------------------------
def	delete_proc (dbi,id)
	sql_str="DELETE from cities where ID = '#{id}'"
	puts sql_str
	dbi.execute(sql_str)
end
# ------------------------------------------------------------
def	insert_proc (dbi,id,name,population,date_mod)
	sql_str="INSERT into cities " \
		+ "(id, Name, Population, date_mod) values \
		('#{id}', '#{name}',#{population},'#{date_mod}')"
#puts sql_str
	dbi.execute(sql_str)
end
# ------------------------------------------------------------
def	create_proc (dbi)
sql_str="create TABLE cities (" \
	+ "id varchar(10) NOT NULL PRIMARY KEY," \
	+ "name varchar(20)," \
	+ "population int," \
	+ "date_mod varchar(40))"
#puts sql_str
dbi.execute(sql_str)
end
# ------------------------------------------------------------
def	drop_proc (dbi)
sql_str="drop table cities"
#puts sql_str
dbi.execute(sql_str)
end
# ------------------------------------------------------------
end
# ------------------------------------------------------------
