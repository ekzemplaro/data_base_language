DOC=/var/www/data_base/doc
cat $DOC/head_short.txt head.txt  second.txt tail.txt > info_language.html
#
ln -s info_language.html index.html
