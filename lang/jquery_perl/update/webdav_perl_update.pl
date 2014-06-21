#! /usr/bin/perl
#
#	webdav_perl_update.pl
#
#						Mar/18/2013
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
my $uri = 'http://host_dbase:3004/city/tokyo.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
my %dict_aa = %{decode_json ($str_json)};
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** webdav_perl_update.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	text_manipulate::dict_update_proc ($id,$population,%dict_aa);
	$it++;
	}
#
my $json_str_new = encode_json (\%dict_aa);
#
uri_get::uri_put_proc ($uri,$json_str_new);
#
print "*** webdav_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
