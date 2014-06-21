#
DOC=/var/www/data_base/doc
#
cat $DOC/head_common.txt head.txt contents.txt \
	$DOC/tail_short.txt > example_json.html
#
ln -s example_json.html index.html
