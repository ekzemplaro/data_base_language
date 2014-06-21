DOC=/var/www/data_base/doc
#
cat $DOC/head_short.txt head.txt  second.txt tail.txt > info_data_base.html
ln -s info_data_base.html index.html
