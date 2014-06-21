#! /bin/bash
#
#	webdav_bash_read.sh
#
#					May/31/2012
#
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
URL="http://host_dbase:3004/city/tokyo.json"
http_proxy=""
curl -X GET $URL
#
#
