DATA_BASE=/var/www/data_base
DOC=$DATA_BASE"/doc"
SQL_FILES=$DATA_BASE"/common/bash_common/sql_files"
#
dbase=$1
#
echo "<hr />" > tmp005
echo "Create<p/><blockquote>" >> tmp005
cat  $SQL_FILES/$dbase/$dbase"_create.sql" >> tmp005
echo "</blockquote>" >> tmp005
echo "<hr />" >> tmp005
echo "Insert<p/><blockquote>" >> tmp005
cat  $SQL_FILES/$dbase/$dbase"_insert.sql" >> tmp005
echo "</blockquote><hr />" >> tmp005
echo "Read<p/><blockquote>" >> tmp005
cat  $SQL_FILES/$dbase/$dbase"_read.sql" >> tmp005
echo "</blockquote><hr />" >> tmp005
#
cat ../head_sql.txt  tmp005 \
	../tail_sql.txt > $dbase"_sql.html"
#
rm -f tmp005
#
