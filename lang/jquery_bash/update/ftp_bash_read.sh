#! /bin/bash
#
#	ftp_bash_read.sh
#
#					May/13/2013
#
#
#
echo "Content-type: text/json"
echo ""
echo ""
#
URL="ftp://scott:tiger@host_dbase/city/iwate.json"
ftp_proxy=""
curl -X GET $URL
#
#
