HTML_CREATE=/var/www/data_base/lang/examples/bash/html_create
#
$HTML_CREATE/html_create.sh html /tmp/tmp0031.html
awk '!/index.html/{print $0}' /tmp/tmp0031.html > click_src.html
#
