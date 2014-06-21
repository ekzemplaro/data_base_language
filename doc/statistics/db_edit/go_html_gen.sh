DATA_BASE=/var/www/data_base
DOC=$DATA_BASE"/doc"
#
#
cat $DOC/head_short.txt db_edit.txt $DOC/tail_short.txt > db_edit.html
#
ln -s db_edit.html index.html
#
#
