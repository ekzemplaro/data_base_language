#
COMMON_DATA=/var/www/data_base/lang/common_data
#
cat $COMMON_DATA/head_common.txt head.txt \
	body.txt tail.txt \
	$COMMON_DATA/tail_common.txt > sound_koho.html
#
ln -s sound_koho.html index.html
