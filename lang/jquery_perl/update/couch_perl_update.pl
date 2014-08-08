#! /usr/bin/perl
#
#	couch_perl_update.pl
#
#						Jul/23/2014
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
my $url = 'http://localhost:5984/nagano';
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** couch_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
#	print "$id $population<br />";
#
	my $url_target = $url . "/" . $id;
	my $str_json = uri_get::uri_get_proc ($url_target);
#	print $url_target;
#	print $str_json;
#
	my $data = decode_json ($str_json);
	$data->{population} = $population;
	my $date_mod = text_manipulate::get_date_mod_proc ();
	$data->{date_mod} = $date_mod;
#
	my $json_str_new = encode_json ($data);
#
#	print $json_str_new;
#	print $url_target;
#
	uri_get::uri_put_proc ($url_target,$json_str_new);
#
	$it++;
	}
#
#
print "*** couch_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
