#! /usr/bin/tclsh
#
#	sqlite3_update.tcl
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
set population_in [lindex $argv 2]
puts $id_in
puts $population_in
set date_mod [clock format [clock seconds] -format {%Y-%m-%d}]
#
sqlite3 db $db_file
#
db eval {
  update cities set population = $population_in, date_mod = $date_mod  where id = $id_in
}

db close

puts "*** 終了 ***"
#
# ---------------------------------------------------------------
