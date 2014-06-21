DATA_BASE=/var/www/data_base
DOC=$DATA_BASE"/doc"
#
#
cat $DOC/head_short.txt ./head_jqueryui_top.txt sql_files.txt  \
	./tail_sql.txt > sql_files.html
#
