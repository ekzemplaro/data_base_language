#! /usr/bin/tclsh
#
#	json_update.tcl
#
#					Apr/23/2014
#
#
# ---------------------------------------------------------------
package require json
#
source /var/www/data_base/common/tcl_common/file_io.tcl
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set file_json [lindex $argv 0]
set id_in [lindex $argv 1]
set population_in [lindex $argv 2]
puts $id_in
puts $population_in
#
set str_json [file_to_str $file_json]
#
set dict_aa [json::json2dict $str_json]
#
set dict_aa [dict_update_proc $dict_aa $id_in $population_in]
#
dict_display_proc $dict_aa
#
set str_json [dict_to_json_proc $dict_aa]
#puts $str_json
#
set fileID [open $file_json "w"]
puts $fileID $str_json
#
puts "*** 終了 ***"
# ---------------------------------------------------------------

#
# ---------------------------------------------------------------
