#
DOC=/var/www/data_base/doc
#
cat $DOC/head_common.txt head.txt contents.txt \
	$DOC/tail_short.txt > example_author.html
#
ln -s example_author.html index.html
