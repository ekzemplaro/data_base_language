#! /usr/bin/tclsh
#
#	sqlite3_read.tcl
#
#					Nov/01/2010
#
# ---------------------------------------------------------------
package require sqlite3
#
puts "*** 開始 ***"
#
set db_file [lindex $argv 0]
#
sqlite3 db $db_file
#
db eval {
  SELECT id,name,population,date_mod  FROM cities
} val {
	puts "$val(id)\t$val(name)\t$val(population)\t$val(date_mod)"
}

db close

puts "*** 終了 ***"
#
# ---------------------------------------------------------------
