#! /usr/bin/tclsh
#
#	mysql_read.tcl
#
#					Jan/06/2011
#
# ---------------------------------------------------------------
package require mysqltcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
#
set con [mysqlconnect -host host_mysql -port 3306 \
  -user scott -password tiger -db city -encoding utf-8]

mysqlexec $con "set NAMES utf8"
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
