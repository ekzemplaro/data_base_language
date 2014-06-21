#!/bin/bash
#
#	read/exist_read.sh
#
#			Jun/05/2013
#
# ----------------------------------------------------------------
#
URL="http://localhost:8086/exist/rest/cities/cities.xml"
BASH_COMMON=/var/www/data_base/common/bash_common
#
echo "*** 開始 ***"
curl -X GET $URL | $BASH_COMMON/xml_to_txt.sh
#
echo "*** 終了 ***"
# ----------------------------------------------------------------
