#! /usr/bin/perl
#
#	excel_read.pl
#
#					Apr/15/2011
#
# ------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use	Spreadsheet::ParseExcel;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use excel_manipulate;
# ------------------------------------------------------------------
my $file_excel = $ARGV[0];
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my %dict_aa = excel_manipulate::excel_read_proc ($file_excel);
text_manipulate::dict_display_proc (%dict_aa);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ------------------------------------------------------------------
