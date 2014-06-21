#! /usr/bin/perl
#
#	riak_delete.pl
#
#					Mar/14/2013
# -------------------------------------------------------
use	strict;
use	warnings;
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use file_io;
use text_manipulate;
use uri_get;
#
# -------------------------------------------------------
print "*** 開始 ***\n";
#
my $key_in = $ARGV[0];
print ("$key_in\n");
#
my $url_target = 'http://localhost:8098/riak/shimane/' . $key_in;
#
print $url_target . "\n";
#
uri_get::uri_delete_proc ($url_target);
#
print "*** 終了 ***\n";
#
# -------------------------------------------------------
