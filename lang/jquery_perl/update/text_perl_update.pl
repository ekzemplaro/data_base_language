#! /usr/bin/perl
#
#	text_perl_update.pl
#
#						May/19/2011
# ---------------------------------------------------------------------
use	strict;
use	warnings;
#
use JSON;
use	CGI qw (:standard);
#
use lib '/var/www/data_base/common/perl_common';
use cgi_manipulate;
use text_manipulate;
#
my $file_text = "/var/tmp/plain_text/cities.txt";
#
#
print "Content-type: text/html\n\n";
#
my %dict_aa = text_manipulate::text_read_proc ($file_text);
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** text_perl_update.pl *** start ***<br />";

	my $it=0;
	foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it]->{id};
	my $population = $arry_bb[0][$it]->{population};
	print "$id $population<br />";
	%dict_aa=text_manipulate::dict_update_proc ($id,$population,%dict_aa);
	$it++;
	}
#
text_manipulate::text_write_proc ($file_text,%dict_aa);
#
print "*** text_perl_update.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
