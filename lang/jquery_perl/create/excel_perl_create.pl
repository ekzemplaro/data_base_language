#! /usr/bin/perl
#
#	jquery_perl/create/excel_perl_create.pl
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
use excel_manipulate;
#
# ----------------------------------------------------------------------
my $file_excel = "/var/tmp/excel/cities.xls";

my %dict_aa = data_prepare_proc ();
#
excel_manipulate::excel_write_proc ($file_excel,%dict_aa);
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
		('t2971','奈良',25600,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2972','大和高田',16700,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2973','大和郡山',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2974','天理',47300,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2975','橿原',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2976','桜井',92600,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2977','五條',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2978','御所',85300,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2979','生駒',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
