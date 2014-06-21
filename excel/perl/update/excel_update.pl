#! /usr/bin/perl
#
#	excel_update.pl
#
#					Apr/15/2011
#
# ------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
#use	Spreadsheet::ParseExcel;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use excel_manipulate;
# ------------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
my $file_excel = $ARGV[0];
my $id_in = $ARGV[1];
my $population_in = $ARGV[2];
print	$id_in . "\t";
print	$population_in . "\n";
#
my %dict_aa = excel_manipulate::excel_read_proc ($file_excel);
%dict_aa = text_manipulate::dict_update_proc ($id_in,$population_in,%dict_aa);
#
excel_manipulate::excel_write_proc ($file_excel,%dict_aa);
#
text_manipulate::dict_display_proc (%dict_aa);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ------------------------------------------------------------------
