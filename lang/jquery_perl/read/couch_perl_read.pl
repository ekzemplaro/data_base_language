#! /usr/bin/perl
#
#	couch_perl_read.pl
#
#						Feb/25/2012
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
my $uri = 'http://host_dbase:5984/city/cities';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
print "Content-type: text/json\n\n";
#
print $str_json;
#
# -------------------------------------------------------------
