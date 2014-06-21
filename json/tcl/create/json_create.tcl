#! /usr/bin/tclsh
#
#	json_create.tcl
#
#					Apr/23/2014
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/json_manipulate.tcl
# ---------------------------------------------------------------
proc data_prepare_proc {} {
#
	set dict_aa [dict create]

	set dict_aa [dict_append_proc $dict_aa t0921 宇都宮 76135 1982-8-23]
	set dict_aa [dict_append_proc $dict_aa t0922 小山 93546 1982-7-24]
	set dict_aa [dict_append_proc $dict_aa t0923 佐野 35129 1982-8-8]
	set dict_aa [dict_append_proc $dict_aa t0924 足利 81246 1982-9-15]
	set dict_aa [dict_append_proc $dict_aa t0925 日光 29736 1982-10-17]
	set dict_aa [dict_append_proc $dict_aa t0926 下野 36517 1982-5-21]
	set dict_aa [dict_append_proc $dict_aa t0927 さくら 64591 1982-9-8]
	set dict_aa [dict_append_proc $dict_aa t0928 矢板 59238 1982-6-14]
	set dict_aa [dict_append_proc $dict_aa t0929 真岡 18935 1982-4-29]
	set dict_aa [dict_append_proc $dict_aa t0930 栃木 93567 1982-5-12]
	set dict_aa [dict_append_proc $dict_aa t0931 大田原 51784 1982-2-15]
	set dict_aa [dict_append_proc $dict_aa t0932 鹿沼 79352 1982-8-24]
	set dict_aa [dict_append_proc $dict_aa t0933 那須塩原 42831 1982-10-8]
	set dict_aa [dict_append_proc $dict_aa t0934 那須烏山 63215 1982-6-19]

	return	$dict_aa
}
# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_out [lindex $argv 0]

set dict_aa [data_prepare_proc]

set fileID [open $fname_out "w"]

set str_json [dict_to_json_proc $dict_aa]
#puts $str_json
puts $fileID $str_json
#
close $fileID

puts "*** 終了 ***"
# ---------------------------------------------------------------
