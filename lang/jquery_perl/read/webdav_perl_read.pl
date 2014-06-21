#! /usr/bin/perl
#
#	webdav_perl_read.pl
#
#						Jun/22/2012
#
# -------------------------------------------------------------
use	strict;
use	warnings;
#
use LWP::UserAgent;
#
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
#
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
print "Content-type: text/json\n\n";
#
print $str_json;
#
# -------------------------------------------------------------
