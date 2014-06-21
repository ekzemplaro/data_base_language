#! /usr/bin/perl
#
#	excel_create.pl
#
#					Jul/09/2011
#
# ------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use	Spreadsheet::WriteExcel;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use excel_manipulate;
# ------------------------------------------------------------------
my $file_out = $ARGV[0];
print	(encode ('utf-8',"*** 開始 ***\n"));

my %hash = data_prepare_proc ();
#
excel_manipulate::excel_write_proc ($file_out,%hash);
#
text_manipulate::dict_display_proc (%hash);

print	(encode ('utf-8',"*** 終了 ***\n"));
#

# ------------------------------------------------------------------
sub data_prepare_proc
{
	my %hash;

	%hash = text_manipulate::dict_append_proc
		('t2971','奈良',75843,'2005-9-12',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2972','大和高田',14278,'2005-3-15',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2973','大和郡山',58641,'2005-6-17',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2974','天理',46732,'2005-8-22',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2975','橿原',27349,'2005-2-28',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2976','桜井',92564,'2005-5-9',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2977','五條',35847,'2005-4-10',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2978','御所',85246,'2005-10-8',%hash);
	%hash = text_manipulate::dict_append_proc
		('t2979','生駒',64127,'2005-5-21',%hash);

	return	%hash;

}

#
# ------------------------------------------------------------------




