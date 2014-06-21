#! /bin/bash
#
#	xml_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
file_xml="/var/tmp/xml_file/cities.xml"
BASH_COMMON=/var/www/data_base/common/bash_common
#
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
cat $file_xml | $BASH_COMMON/xml_to_json.sh
#
