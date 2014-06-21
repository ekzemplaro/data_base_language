#! /bin/bash
#
#	html_jquery_create.sh
#
#					May/06/2011
#
#		html_jquery_create.sh hs jquery_haskell_read.html
#
HTML_CREATE=/var/www/data_base/lang/examples/bash/html_jquery_create
DOC=/var/www/data_base/doc
#
ls ../jquery*.js | sed 's/..\///' > tmp001
ls ../*.$1 | sed 's/..\///' > tmp002
awk -F. '{print $1}' tmp002 | uniq > tmp0025
cat tmp0025 $HTML_CREATE/program_list.txt | sort | uniq -d > tmp0027
#
awk '{print "/var/www/data_base/lang/examples/bash/html_jquery_create/pick_up.sh" ,$1}' tmp0027 > tmp_go_tmp002
bash ./tmp_go_tmp002 > tmp005
#
grep master tmp002 > tmp006
cat tmp005 >> tmp006
#
cat tmp001 tmp006 | awk -f $HTML_CREATE/aw_link_gen > tmp_go_link
#
awk -f $HTML_CREATE/aw_html tmp001 > tmp_html01
echo "<p /> " >> tmp_html01
awk -f $HTML_CREATE/aw_html tmp006 > tmp_html02
bash ./tmp_go_link
#
cat $DOC/head_common.txt head.txt tmp_html01 tmp_html02 tail.txt \
	$DOC/tail_common.txt > $2
#
#
rm -rf tmp001 tmp0* tmp_*
#
