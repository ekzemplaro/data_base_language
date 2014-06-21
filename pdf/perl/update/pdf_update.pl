#!/usr/bin/perl
#
#	pdf_update.pl
#
#					Jun/29/2012
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use pdf_manipulate;
# ----------------------------------------------------------------
#
print	(encode ('utf-8',"*** 開始 ***\n"));
my $file_pdf = $ARGV[0];
my $id_in = $ARGV[1];
my $population_in = $ARGV[2];
print $file_pdf . "\n";
print	$id_in . "\t";
print	$population_in . "\n";
#
my %dict_aa = pdf_manipulate::pdf_to_dict_proc ($file_pdf);

%dict_aa = text_manipulate::dict_update_proc ($id_in,$population_in,%dict_aa);

text_manipulate::dict_display_proc (%dict_aa);

pdf_manipulate::dict_to_pdf_proc ($file_pdf,%dict_aa);

print	(encode ('utf-8',"*** 終了 ***\n"));
 
exit 0;
# ----------------------------------------------------------------
