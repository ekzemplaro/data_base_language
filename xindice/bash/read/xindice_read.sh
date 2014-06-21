#!/bin/bash
#
#	read/xindice_read.sh
#
#				May/22/2012
#
# ------------------------------------------------------------
export http_proxy=""
URL="http://host_dbase:8888/xindice/db/cities/cities"
#
BASH_COMMON=/var/www/data_base/common/bash_common
# ------------------------------------------------------------
echo	"*** 開始 ***"
#
curl -X GET $URL | $BASH_COMMON/xml_to_txt.sh
#
echo	"*** 終了 ***"
# ------------------------------------------------------------
