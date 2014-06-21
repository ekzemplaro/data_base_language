#! /usr/bin/tclsh
#
#	csv_delete.tcl
#
#					Apr/23/2014
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl

# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_txt [lindex $argv 0]
set id_in [lindex $argv 1]
puts $id_in
#
set dict_aa [csv_read_proc $fname_txt]
#
set dict_aa [dict_delete_proc $dict_aa $id_in]

dict_display_proc $dict_aa

csv_write_proc $fname_txt $dict_aa

puts "*** 終了 ***"
# ---------------------------------------------------------------
