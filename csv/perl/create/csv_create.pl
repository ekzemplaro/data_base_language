#! /usr/bin/perl
#
#	csv_create.pl
#
#					Dec/01/2011
#
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
#
# ----------------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
my $file_text= $ARGV[0];
#
my %hash = data_prepare_proc ();
#
#text_manipulate::dict_display_proc (%hash);
text_manipulate::csv_write_proc ($file_text,%hash);
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %hash;
	%hash = text_manipulate::dict_append_proc
		('t1271','千葉',75843,'2005-9-12',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1272','勝浦',14278,'2005-3-15',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1273','市原',58641,'2005-6-17',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1274','流山',46432,'2005-8-22',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1275','八千代',27149,'2005-2-28',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1276','我孫子',92187,'2005-5-9',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1277','鴨川',35694,'2005-4-10',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1278','銚子',85326,'2005-10-8',%hash);
	%hash = text_manipulate::dict_append_proc
		('t1279','市川',64281,'2005-5-21',%hash);

	return	%hash;
}
# ----------------------------------------------------------------
