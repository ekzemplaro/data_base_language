#
COMMON_DATA=/var/www/data_base/lang/common_data
#
cat $COMMON_DATA/head_common.txt head.txt contents.txt \
	$COMMON_DATA/tail_common.txt > example_simple.html
#
ln -s example_simple.html index.html
