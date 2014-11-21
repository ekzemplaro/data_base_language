#! /usr/bin/tclsh
#
#	maria_read.tcl
#
#					Nov/17/2014
#
# ---------------------------------------------------------------
package require mysqltcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set con [mysqlconnect -host localhost -port 3306 \
  -user scott -password tiger -db city -encoding utf-8]

set sql {
  SELECT id, name, population,date_mod
    FROM cities
}

set resultset [mysqlsel $con $sql -list]
foreach row $resultset {
  puts $row
}

mysqlclose $con
#
puts "*** 終了 ***"
#
# ---------------------------------------------------------------
