#! /usr/bin/tclsh
#
#	text_updte.tcl
#
#					Apr/23/2014
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl

# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_txt [lindex $argv 0]
set id_in [lindex $argv 1]
set population_in [lindex $argv 2]
puts $id_in
puts $population_in
#
set dict_aa [text_read_proc $fname_txt]
#

set dict_aa [dict_update_proc $dict_aa $id_in $population_in]
#
dict_display_proc $dict_aa

text_write_proc $fname_txt $dict_aa

puts "*** 終了 ***"
# ---------------------------------------------------------------
