DATA_BASE=/var/www/data_base
DOC=$DATA_BASE"/doc"
#
#
cat $DOC/head_short.txt lang_sum.txt $DOC/tail_short.txt > lang_sum.html
#
ln -s lang_sum.html index.html
#
