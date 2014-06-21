#! /bin/bash
#
#	json_couch_read.sh
#
#					Jun/07/2010
#
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
http_proxy=""
curl -X GET http://cdbd026:5984/city/cities
#
#
