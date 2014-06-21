#! /bin/bash
#
#	bash_common/xml_to_json.sh
#
#					Feb/08/2011
#
#
#
#
BASH_COMMON="/var/www/data_base/common/bash_common"
awk_file=$BASH_COMMON"/awk_files/awk_to_json"
file_xsl=$BASH_COMMON"/xsl_files/xml_to_txt_cities.xsl"
#
#
#
xalan -xsl $file_xsl \
	| awk '{if (2 < NF) print $0}' \
	| awk -f $awk_file
#
#
