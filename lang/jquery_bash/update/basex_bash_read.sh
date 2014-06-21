#! /bin/bash
#
#	basex_bash_read.sh
#
#					May/31/2012
#
#
#
BASH_COMMON=/var/www/data_base/common/bash_common
#
URL="http://admin:admin@localhost:8984/rest/cities?query=/"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
curl -X GET $URL | $BASH_COMMON/xml_to_json.sh
#
#
