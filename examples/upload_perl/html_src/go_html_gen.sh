HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
#
$HTML_CREATE/html_create.sh pl /tmp/tmp0093.html
#
awk '!/Return/{print $0}' /tmp/tmp0093.html >  upload_perl_src.html
