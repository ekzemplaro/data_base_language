#! /bin/bash
#
#	html_create.sh
#
#					May/06/2011
#
#		html_create.sh hs jquery_haskell_read.html
#
HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
DOC=/var/www/data_base/doc
#
ls ../*.js | sed 's/..\///' > tmp001
ls ../*.$1 | sed 's/..\///' > tmp002
#sed 's/..\///' tmp01 > tmp03
cat tmp001 tmp002 | awk -f $HTML_CREATE/aw_link_gen > tmp_go_link
#
awk -f $HTML_CREATE/aw_html tmp001 > tmp_html01
echo "<p /> " >> tmp_html01
awk -f $HTML_CREATE/aw_html tmp002 > tmp_html02
bash ./tmp_go_link
#
cat $DOC/head_common.txt head.txt tmp_html01 tmp_html02 tail.txt \
	$DOC/tail_common.txt > $2
#
rm -rf tmp001 tmp0* tmp_*
