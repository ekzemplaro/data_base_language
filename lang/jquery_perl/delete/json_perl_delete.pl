#! /usr/bin/perl
#
#	json_perl_delete.pl
#
#						May/19/2011
# ---------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	JSON;
use	CGI qw (:standard);
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use text_manipulate;
use file_io;
#
my $file_json= "/var/tmp/json/cities.json";
#
my $str_json = file_io::string_read_proc ($file_json);
#
my %dict_aa = %{decode_json ($str_json)};
#
#
#
print "Content-type: text/html\n\n";
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** json_perl_delete.pl *** start ***<br />";
#
my $it=0;
foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	%dict_aa=text_manipulate::dict_delete_proc ($id,%dict_aa);
	$it++;
	}
#
my $json_str_new = encode_json (\%dict_aa);
#
file_io::string_write_proc ($file_json,$json_str_new);
#
print "*** json_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
