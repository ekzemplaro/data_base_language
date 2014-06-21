#! /bin/bash
#
#	couch_bash_read.sh
#
#					May/31/2012
#
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
URL=http://host_dbase:5984/city/cities
http_proxy=""
curl -X GET $URL
#
#
