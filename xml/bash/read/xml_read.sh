#! /bin/bash
#
#	read/xml_read.sh
#
#					May/06/2011
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
#
file_xml=$1
cat $file_xml | $BASH_COMMON/xml_to_txt.sh
#
echo "*** 終了 ***"
