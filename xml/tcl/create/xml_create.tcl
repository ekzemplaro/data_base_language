#! /usr/bin/tclsh
#
#	xml_create.tcl
#
#					Oct/29/2014
#
# ---------------------------------------------------------------
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
source /var/www/data_base/common/tcl_common/xml_manipulate.tcl
# ---------------------------------------------------------------
proc data_prepare_proc {} {
#
	set dict_aa [dict create]

	set dict_aa [dict_append_proc $dict_aa t2261 静岡 76241 1982-3-21]
	set dict_aa [dict_append_proc $dict_aa t2262 浜松 53172 1982-9-23]
	set dict_aa [dict_append_proc $dict_aa t2263 沼津 79362 1982-5-24]
	set dict_aa [dict_append_proc $dict_aa t2264 三島 91382 1982-3-9]
	set dict_aa [dict_append_proc $dict_aa t2265 富士 79827 1982-8-12]
	set dict_aa [dict_append_proc $dict_aa t2266 熱海 57169 1982-7-28]
	set dict_aa [dict_append_proc $dict_aa t2267 富士宮 39487 1982-6-19]
	set dict_aa [dict_append_proc $dict_aa t2268 藤枝 63745 1982-11-12]
	set dict_aa [dict_append_proc $dict_aa t2269 御殿場 54651 1982-12-9]
	set dict_aa [dict_append_proc $dict_aa t2270 島田 41273 1982-10-25]

	return	$dict_aa
}

# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_out [lindex $argv 0]
set fileID [open $fname_out "w"]

set dict_aa [data_prepare_proc]

set str_xml [dict_to_xml_proc $dict_aa]

puts $fileID $str_xml

#
close $fileID

puts "*** 終了 ***"
# ---------------------------------------------------------------
