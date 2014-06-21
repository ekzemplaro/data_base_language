#! /bin/bash
#
#	basex_read.sh
#
#					Oct/27/2011
# ------------------------------------------------------------
export http_proxy=""
URL="http://admin:admin@localhost:8984/rest/cities?query=/"
BASH_COMMON=/var/www/data_base/common/bash_common
# ------------------------------------------------------------
echo	"*** 開始 ***"
#
curl -X GET $URL | $BASH_COMMON/xml_to_txt.sh
#
echo	"*** 終了 ***"
# ------------------------------------------------------------
