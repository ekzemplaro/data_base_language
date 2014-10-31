#! /usr/bin/tclsh
#
#	xml_read.tcl
#
#					Oct/29/2014
#
# ---------------------------------------------------------------
package require xml
#
source /var/www/data_base/common/tcl_common/show_xml.tcl
source /var/www/data_base/common/tcl_common/text_manipulate.tcl
# ---------------------------------------------------------------
puts "*** 開始 ***"
set fname_in [lindex $argv 0]
#
set dict_aa [dict create]
#
set fin [open $fname_in r]; set buf [read $fin]; close $fin
#
# ログファイル初期化
clearlog

set h {}
set parser [::xml::parser -parser tcl \
 -characterdatacommand "cdataCmd h" \
 -elementstartcommand "estartCmd h" \
 -elementendcommand "eendCmd h" \
 -defaultcommand defaultCmd \
]
$parser parse $buf
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
