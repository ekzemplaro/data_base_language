#
#	go_gen.sh
#
#					Sep/12/2014
#
DATA_BASE=/var/www/data_base
DOC=$DATA_BASE/doc
rhino html_gen.js > tmp002
#
cat $DOC/head_common.txt head_dbase.txt \
	../by_language/common_only.txt tmp002 tail.txt > by_dbase.html
cat $DOC/head_common.txt head_jquery.txt \
	lib_common.txt tmp002 tail.txt > dbase_full.html
#
#cat $DOC/head_common.txt head_jquery.txt tail.txt > jquery_dbase.html
#
#mv by_dbase.html $DOC/frame
#
#
#
rm -f tmp002
#
