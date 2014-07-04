#! /usr/bin/perl
#
#	couch_update.pl
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
my $population_in = $ARGV[1];
print ("$key_in\t$population_in\n");
#
my $url = 'http://localhost:5984/nagano';
#
my $url_target = $url . "/" . $key_in;
my $str_json = uri_get::uri_get_proc ($url_target);
#
my $data = decode_json ($str_json);
#
print $str_json;
my %datax = %{$data};
#
if (exists $datax{"error"})
	{
	print "*** not exist ***\n";
	}
else
	{
	print "*** exists ***\n";
my $name = $data->{name};
$data->{population} = $population_in;
$data->{date_mod} = text_manipulate::get_date_mod_proc ();
#
print $key_in . "\t";
print encode ('utf-8',$name) . "\n";
#
#
my $json_str_new = encode_json ($data);
print $json_str_new . "\n";
#
uri_get::uri_put_proc ($url_target,$json_str_new);
	}
#
print "*** 終了 ***\n";
#
# -------------------------------------------------------
