#! /usr/bin/tclsh
#
#	tyrant_read.tcl
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
set port 1978
#
set keys(0) "t4761"
set keys(1) "t4762"
set keys(2) "t4763"
set keys(3) "t4764"
set keys(4) "t4765"
set keys(5) "t4766"
set keys(6) "t4767"
set keys(7) "t4768"
set keys(8) "t4769"
#
set dict_aa [mcached_to_dict_proc $server $port keys]
#
dict_display_proc $dict_aa
#

puts "*** 終了 ***"
# ---------------------------------------------------------------
