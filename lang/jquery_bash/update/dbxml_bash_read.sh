#! /bin/bash
#
#	dbxml_bash_read.sh
#
#					Feb/08/2011
#
#
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
export http_proxy=""
URL="http://scott:tiger@cpt003:7280/rest/cities/cities.xml"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
curl -X GET $URL | $BASH_COMMON/xml_to_json.sh
#
#
