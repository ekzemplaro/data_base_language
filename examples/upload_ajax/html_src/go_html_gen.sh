HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
#
$HTML_CREATE/html_create.sh php /tmp/tmp0047.html
#
awk '!/Return/{print $0}' /tmp/tmp0047.html >  ajax_upload_src.html
