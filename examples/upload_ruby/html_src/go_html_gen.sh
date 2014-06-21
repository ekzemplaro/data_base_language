HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
#
$HTML_CREATE/html_create.sh rb /tmp/tmp0096.html
#
awk '!/Return/{print $0}' /tmp/tmp0096.html >  upload_ruby_src.html
