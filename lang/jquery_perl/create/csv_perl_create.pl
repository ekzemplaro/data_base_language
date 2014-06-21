#! /usr/bin/perl
#
#	jquery_perl/create/csv_perl_create.pl
#
#
#						May/19/2011
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
#
# ----------------------------------------------------------------------
my $file_csv = "/var/tmp/csv/cities.csv";

my %dict_aa = data_prepare_proc ();
#
text_manipulate::csv_write_proc ($file_csv,%dict_aa);
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
		('t1271','千葉',74200,'2005-9-12',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1272','勝浦',14200,'2005-3-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1273','市原',58600,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1274','流山',46400,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1275','八千代',27300,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1276','我孫子',92500,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1277','鴨川',35100,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1278','銚子',85300,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1279','市川',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
