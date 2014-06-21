#! /usr/bin/perl
#
#	jquery_perl/create/pdf_perl_create.pl
#
#
#						Jul/31/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use pdf_manipulate;
#
# ----------------------------------------------------------------------
my $file_pdf = "/var/tmp/pdf/cities.pdf";

my %dict_aa = data_prepare_proc ();
#
pdf_manipulate::dict_to_pdf_proc ($file_pdf,%dict_aa);
#
print "Content-type: text/html\n\n";
#
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2531','大津',75800,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2532','草津',16900,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2533','守山',51600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2534','栗東',46300,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2535','野洲',27400,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2536','甲賀',92800,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2537','湖南',35100,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2538','近江八幡',85700,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2539','彦根',64200,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
