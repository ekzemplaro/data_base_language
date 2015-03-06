#! /usr/bin/tclsh
#
#	mcached_read.tcl
#
#					Feb/10/2015
#
# ---------------------------------------------------------------
package require json
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/mcached_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"

set server "localhost"
set port 11211
#
set keys(0) "t1731"
set keys(1) "t1732"
set keys(2) "t1733"
set keys(3) "t1734"
set keys(4) "t1735"
set keys(5) "t1736"
set keys(6) "t1737"
set keys(7) "t1738"
set keys(8) "t1739"
#
puts [array size keys]
set dict_aa [mcached_to_dict_proc $server $port keys]
#
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
