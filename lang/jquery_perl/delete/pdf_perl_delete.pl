#! /usr/bin/perl
#
#	pdf_perl_delete.pl
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
use pdf_manipulate;
#
my $file_pdf = "/var/tmp/pdf/cities.pdf";
#
#
print "Content-type: text/html\n\n";
#
my %dict_aa = pdf_manipulate::pdf_to_dict_proc ($file_pdf);
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
pdf_manipulate::dict_to_pdf_proc ($file_pdf,%dict_aa);
#
print "*** pdf_perl_delete.pl *** end ***<br />";
#
# ---------------------------------------------------------------------
#
