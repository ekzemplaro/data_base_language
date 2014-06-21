#! /usr/bin/tclsh8.5
#
#	exist_read.tcl
#
#					Feb/16/2012
#
# ---------------------------------------------------------------
package require TclCurl
package require xml

source /var/www/data_base/common/tcl_common/show_xml.tcl
source /var/www/data_base/common/tcl_common/http_get.tcl
source /var/www/data_base/common/tcl_common/text_manipulate.tcl

# ---------------------------------------------------------------
puts "*** 開始 ***"

set url_in http://localhost:8086/exist/rest/cities/cities.xml
set data_in [http_get $url_in]
set dict_aa [dict create]
#
set h {}
set parser [::xml::parser -parser tcl \
 -characterdatacommand "cdataCmd h" \
 -elementstartcommand "estartCmd h" \
 -elementendcommand "eendCmd h" \
 -defaultcommand defaultCmd \
]
$parser parse [encoding convertfrom utf-8 $data_in]
#
dict_display_proc $dict_aa
#
puts "*** 終了 ***"
# ---------------------------------------------------------------
