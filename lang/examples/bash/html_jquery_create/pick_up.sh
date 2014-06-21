#! /bin/bash
#
#	pick_up.sh
#
#					May/06/2011
#
#
HTML_CREATE=/var/www/data_base/lang/examples/bash/html_jquery_create
#
awk -F. -v vv=$1 -f $HTML_CREATE/aw_pick_up tmp002
