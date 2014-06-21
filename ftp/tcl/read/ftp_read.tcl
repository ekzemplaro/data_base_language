#! /usr/bin/tclsh8.5
#
#	ftp_read.tcl
#
#					oct/14/2011
#
# ---------------------------------------------------------------
package require json
#
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/file_io.tcl
# ---------------------------------------------------------------
package require ftp
#fconfigure stdout -encoding shiftjis

set REMOTEHOST host_dbase
set USER       scott
set PASSWORD   tiger
set REMOTEDIR  city

puts "*** 開始 ***"
#
set con [::ftp::Open $REMOTEHOST $USER $PASSWORD]
::ftp::Type $con ascii
#
::ftp::Cd $con $REMOTEDIR

set files [::ftp::NList $con]
puts $files
puts "*** rrr ***"
set file_tmp "/tmp/tmp00546.json"
#
::ftp::Get $con "iwate.json" $file_tmp
::ftp::Close $con
#
set str_json [file_to_str $file_tmp]
#
set dict_aa [json::json2dict $str_json]
#
dict_display_proc $dict_aa
#
file delete $file_tmp
#
puts "*** 終了 ***"

# ---------------------------------------------------------------
