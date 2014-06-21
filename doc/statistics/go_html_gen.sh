DATA_BASE=/var/www/data_base
DOC=$DATA_BASE"/doc"
#
cat $DOC/head_short.txt statistics.txt  \
	$DOC/tail_short.txt > statistics.html
#
#
#
