#! /usr/bin/tclsh
#
#	ftp_delete.tcl
#
#					Jul/08/2014
#
# ---------------------------------------------------------------
package require json
#
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
source /var/www/data_base/common/tcl_common/file_io.tcl
# ---------------------------------------------------------------
package require ftp
#
set REMOTEHOST host_dbase
set USER       scott
set PASSWORD   tiger
set REMOTEDIR  city

puts "*** 開始 ***"
set id_in [lindex $argv 0]
puts $id_in
#
set con [::ftp::Open $REMOTEHOST $USER $PASSWORD]
::ftp::Type $con ascii
#
::ftp::Cd $con $REMOTEDIR

set files [::ftp::NList $con]
puts $files
puts "*** rrr ***"
set file_tmp "/tmp/tmp00428.json"
#
::ftp::Get $con "iwate.json" $file_tmp
#
set str_json [file_to_str $file_tmp]
#
set dict_aa [json::json2dict $str_json]
#
set dict_aa [dict_delete_proc $dict_aa $id_in]
#
dict_display_proc $dict_aa
#
set str_json [dict_to_json_proc $dict_aa]
#puts $str_json
#
set fileID [open $file_tmp "w"]
puts $fileID $str_json
close $fileID
#
::ftp::Put $con $file_tmp "iwate.json"
#
::ftp::Close $con
#
file delete $file_tmp
#
puts "*** 終了 ***"

# ---------------------------------------------------------------
