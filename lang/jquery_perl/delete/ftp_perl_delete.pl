#! /usr/bin/perl
#
#	ftp_perl_delete.pl
#
#						Feb/25/2013
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use	Encode;
use	JSON;
use	CGI qw (:standard);
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use text_manipulate;
use uri_get;
#
# ---------------------------------------------------------------------
my $uri = 'ftp://scott:tiger@cddn007/city/iwate.json';
#
my $str_json = uri_get::uri_get_proc ($uri);
#
my %dict_aa = %{decode_json ($str_json)};
#
print "Content-type: text/html\n\n";
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** ftp_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id<br />";
	%dict_aa=text_manipulate::dict_delete_proc ($id,%dict_aa);
	$it++;
	}
#
my $json_str_new = encode_json (\%dict_aa);
#
uri_get::uri_put_proc ($uri,$json_str_new);
#
print "*** ftp_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
