#
COMMON_DATA=/var/www/data_base/lang/common_data
#
cat $COMMON_DATA/head_common.txt head.txt \
	body.txt tail_portion.txt \
	$COMMON_DATA/tail_common.txt > couchdb_total.html
