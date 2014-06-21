#
COMMON_DATA=/var/www/data_base/lang/common_data
#
cat $COMMON_DATA/head_common.txt head.txt \
	body_button.txt tail.txt \
		> librivox_read.html
