#
COMMON_DATA=/var/www/data_base/lang/common_data
#
cat $COMMON_DATA/head_common.txt head.txt \
	$COMMON_DATA/body_button.txt tail.txt \
	$COMMON_DATA/tail_common.txt > jquery_bash_create.html
