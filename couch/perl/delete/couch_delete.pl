#! /usr/bin/perl
#
#	couch_delete.pl
#
#					Jun/23/2014
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
my $url = 'http://localhost:5984/nagano';
#
my $url_target = $url . "/" . $key_in;
#
my $str_json = uri_get::uri_get_proc ($url_target);
#
my $data = decode_json ($str_json);
#
#
my %datax = %{$data};
#
if (exists $datax{"_rev"})
	{
	print "*** exists ***\n";
my $name = $data->{name};
my $rev = $data->{_rev};
print $key_in . "\t";
print encode ('utf-8',$name) . "\t";
print $rev . "\n";
	my $url_del = $url_target . '?rev=' . $rev;
	uri_get::uri_delete_proc ($url_del);
	}
else
	{
	print "*** not exist ***\n";
	}
#if (exists $data{$key_in})
#	{
#	uri_get::uri_put_proc ($uri,$json_str_new);
#	}
#
print "*** 終了 ***\n";
#
# -------------------------------------------------------
