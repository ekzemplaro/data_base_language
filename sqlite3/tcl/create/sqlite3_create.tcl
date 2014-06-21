#! /usr/bin/tclsh
#
#	sqlite3_create.tcl
#
#					Jul/16/2011
#
# ---------------------------------------------------------------
package require sqlite3
#
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set db_file [lindex $argv 0]
#
sqlite3 db $db_file
#
db eval {drop table cities}

db eval {create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,
		name text,population int,date_mod text)}
#
db eval {insert into cities (id, name, population, date_mod)
			values ('t0711','郡山', 54597,'1982-9-21')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0712','会津若松', 71837,'1982-6-24')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0713','白河', 65239,'1982-3-14')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0714','福島', 81581,'1982-6-21')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0715','喜多方', 62943,'1982-3-18')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0716','二本松', 32875,'1982-5-9')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0717','いわき', 42762,'1982-9-15')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0718','相馬', 53184,'1982-8-21')}

db eval {insert into cities (id, name, population, date_mod)
			values ('t0719','須賀川', 29516,'1982-10-17')}

db close

puts "*** 終了 ***"
#
# ---------------------------------------------------------------
