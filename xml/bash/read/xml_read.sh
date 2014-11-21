#! /bin/bash
#
#	read/xml_read.sh
#
#					Nov/19/2014
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
file_xml=$1
#
$BASH_COMMON/xml_to_txt.sh $file_xml
#
echo "*** 終了 ***"
