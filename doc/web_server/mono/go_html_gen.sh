DOC=/var/www/data_base/doc
#
cat $DOC/head_short.txt head.txt contents.txt $DOC/tail_short.txt > mono.html
#
ln -s mono.html index.html
