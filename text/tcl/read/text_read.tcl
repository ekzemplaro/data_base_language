#! /usr/bin/tclsh
#
#	text_read.tcl
#
#					Apr/23/2014
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl

# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_in [lindex $argv 0]
#
set dict_aa [text_read_proc $fname_in]
#
dict_display_proc $dict_aa
#

puts "*** 終了 ***"
# ---------------------------------------------------------------
