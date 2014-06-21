#! /usr/bin/perl
#
#	pdf_create.pl
#
#						Jun/28/2012
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;

use PDF::API2;
use PDF::API2::Resource::CIDFont::CJKFont;
use Jcode;

use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use pdf_manipulate;
# ----------------------------------------------------------------
print encode ('utf-8',"*** 開始 ***\n");
#
my $file_pdf = $ARGV[0];
#
my %dict_aa = data_prepare_proc ();
#
pdf_manipulate::dict_to_pdf_proc ($file_pdf,%dict_aa);
#
print encode ('utf-8',"*** 終了 ***\n");
#
# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t2531','大津',75142,'2005-10-24',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2532','草津',14273,'2005-7-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2533','守山',59641,'2005-6-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2534','栗東',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2535','野洲',27349,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2536','甲賀',92843,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2537','湖南',34687,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2538','近江八幡',15276,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t2539','彦根',64527,'2005-5-21',%dict_aa);

	return	%dict_aa;
}
# ----------------------------------------------------------------
