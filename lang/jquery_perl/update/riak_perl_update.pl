#! /usr/bin/perl
#
#	riak_perl_update.pl
#
#						Apr/12/2013
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	JSON;
use	CGI qw (:standard);
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use text_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $url_base = 'http://localhost:8098/riak/shimane';
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
#
my $it = 0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	my $url_target = $url_base . '/' . $id;
	my $str_json = uri_get::uri_get_proc ($url_target);
	my %city = %{decode_json ($str_json)};
	my $date_mod = text_manipulate::get_date_mod_proc ();
#
	$city{"population"} = $population;
	$city{"date_mod"} = $date_mod;
	my $json_str_new = encode_json (\%city);
	uri_get::uri_put_proc ($url_target,$json_str_new);
	$it++;
	}
#
#
print "*** riak_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
