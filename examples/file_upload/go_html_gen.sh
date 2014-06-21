#
DOC=/var/www/data_base/doc
#
cat $DOC/head_common.txt head.txt contents.txt \
	$DOC/tail_short.txt > file_upload.html
#
ln -s file_upload.html index.html
