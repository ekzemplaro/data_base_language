#! /usr/bin/tclsh
#
#	json_read.tcl
#
#					Apr/23/2014
#
#
# ---------------------------------------------------------------
package require json
#
source /var/www/data_base/common/tcl_common/file_io.tcl
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_in [lindex $argv 0]
set str_json [file_to_str $fname_in]
#
set dict_aa [json::json2dict $str_json]
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------

#
# ---------------------------------------------------------------
