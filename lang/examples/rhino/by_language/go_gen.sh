DOC=/var/www/data_base/doc
#
rhino by_language.js > tmp001
cat $DOC/head_common.txt head_lang.txt common_only.txt tmp001 ../html_gen/tail.txt > by_language.html
#
# mv by_language.html $DOC/frame
#
rm -f tmp001
