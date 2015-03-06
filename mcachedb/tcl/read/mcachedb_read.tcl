#! /usr/bin/tclsh
#
#	mcachedb_read.tcl
#
#					Feb/11/2015
#
# ---------------------------------------------------------------
package require json
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/mcached_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"

set server "host_ubuntu1"
set port 21201
#
set keys(0) "t1521"
set keys(1) "t1522"
set keys(2) "t1523"
set keys(3) "t1524"
set keys(4) "t1525"
set keys(5) "t1526"
set keys(6) "t1527"
set keys(7) "t1528"
set keys(8) "t1529"
set keys(9) "t1530"
set keys(10) "t1531"
set keys(11) "t1532"
#
set dict_aa [mcached_to_dict_proc $server $port keys]
#
dict_display_proc $dict_aa
#

puts "*** 終了 ***"
# ---------------------------------------------------------------
