HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
#
$HTML_CREATE/html_create.sh php /tmp/tmp0098.html
#
awk '!/Return/{print $0}' /tmp/tmp0098.html >  server_sent_events_src.html
