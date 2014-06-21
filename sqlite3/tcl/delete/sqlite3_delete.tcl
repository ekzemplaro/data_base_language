#! /usr/bin/tclsh
#
#	sqlite3_delete.tcl
#
#					Oct/01/2010
#
# ---------------------------------------------------------------
package require sqlite3
#
puts "*** 開始 ***"
#
set db_file [lindex $argv 0]
set id_in [lindex $argv 1]
puts $id_in
#
sqlite3 db $db_file
#
db eval {
	delete from cities where id = $id_in
}

db close

puts "*** 終了 ***"
#
# ---------------------------------------------------------------
