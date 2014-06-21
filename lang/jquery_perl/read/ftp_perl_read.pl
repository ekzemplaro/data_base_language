#! /usr/bin/perl
#
#	jquery_perl/read/ftp_perl_read.pl
#
#
#						Feb/25/2013
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
#
# ----------------------------------------------------------------------
my $uri = 'ftp://scott:tiger@host_dbase/city/iwate.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
#
print "Content-type: text/json\n\n";
#
print decode ('utf-8',$str_json), "\n";
#
print "\n";
# ----------------------------------------------------------------------
