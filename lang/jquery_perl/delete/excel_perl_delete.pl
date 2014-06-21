#! /usr/bin/perl
#
#	excel_perl_delete.pl
#
#						Jul/27/2012
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
use excel_manipulate;
#
my $file_excel = "/var/tmp/excel/cities.xls";
#
#
print "Content-type: text/html\n\n";
#
my %dict_aa = excel_manipulate::excel_read_proc ($file_excel);
#
#
my @arry_bb = cgi_manipulate::parse_parameter ();
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
excel_manipulate::excel_write_proc ($file_excel,%dict_aa);
#
print "*** excel_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
