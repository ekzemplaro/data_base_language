#! /bin/bash
#
#	xindice_bash_read.sh
#
#					Feb/08/2011
#
#
#
#
export http_proxy=""
URL="http://cdbd026:8888/xindice/db/cities/cities"
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
curl -X GET $URL | $BASH_COMMON/xml_to_json.sh
#
