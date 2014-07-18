#! /usr/bin/tclsh
#
#	ftp_create.tcl
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
proc data_prepare_proc {} {
#
	set dict_aa [dict create]

	set dict_aa [dict_append_proc $dict_aa t0361 盛岡 32871 1982-9-13]
	set dict_aa [dict_append_proc $dict_aa t0362 久慈 21695 1982-2-25]
	set dict_aa [dict_append_proc $dict_aa t0363 二戸 18254 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t0364 宮古 81746 1982-9-15]
	set dict_aa [dict_append_proc $dict_aa t0365 遠野 27836 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t0366 八幡平 32567 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t0367 大船渡 64192 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t0368 一関 59732 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t0369 花巻 18935 1982-4-29]

	return	$dict_aa
}

# ---------------------------------------------------------------
package require ftp
#fconfigure stdout -encoding shiftjis

set REMOTEHOST host_dbase
set USER       scott
set PASSWORD   tiger
set REMOTEDIR  city

puts "*** 開始 ***"
set tmp_json "/tmp/tmp09345.json"
set fileID [open $tmp_json "w"]
set dict_aa [data_prepare_proc]
set str_json [dict_to_json_proc $dict_aa]
puts $fileID $str_json
close $fileID
#
set con [::ftp::Open $REMOTEHOST $USER $PASSWORD]
::ftp::Type $con ascii
#
::ftp::Cd $con $REMOTEDIR

set files [::ftp::NList $con]
puts $files
puts "*** rrr ***"
#
::ftp::Put $con $tmp_json "iwate.json"
::ftp::Close $con
#
#
dict_display_proc $dict_aa
#
file delete $tmp_json
#
puts "*** 終了 ***"

# ---------------------------------------------------------------
