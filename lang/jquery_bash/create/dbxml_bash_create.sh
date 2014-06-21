#! /bin/bash
#
#	dbxml_bash_read.sh
#
#					Jun/10/2010
#
#
#
bash_common=/var/www/data_base/common/bash_common
#
export http_proxy=""
URL="http://scott:tiger@cpt003:7280/rest/cities/cities.xml"
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
curl -X GET $URL | $bash_common/xml_to_json.sh
#
#
