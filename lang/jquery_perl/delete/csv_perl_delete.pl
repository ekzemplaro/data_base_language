#! /usr/bin/perl
#
#	csv_perl_delete.pl
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
my $file_csv = "/var/tmp/csv/cities.csv";
#
#
print "Content-type: text/html\n\n";
#
my %dict_aa = text_manipulate::csv_read_proc ($file_csv);
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
#
print "*** csv_perl_delete.pl *** start ***<br />";

#	foreach (@arry)
	my $it=0;
	foreach (@{$arry_bb[0]})
	{
	my $id = $arry_bb[0][$it];
	print "$id <br />";
	%dict_aa=text_manipulate::dict_delete_proc ($id,%dict_aa);
	$it++;
	}
#
text_manipulate::csv_write_proc ($file_csv,%dict_aa);
#
print "*** csv_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
