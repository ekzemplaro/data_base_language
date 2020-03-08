HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
#
$HTML_CREATE/html_create.sh html /tmp/tmp0095.html
#
awk '!/Return/{print $0}' /tmp/tmp0095.html >  linechart01_src.html
