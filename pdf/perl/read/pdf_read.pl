#!/usr/bin/perl
#
#	pdf_read.pl
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
print ($file_pdf . "\n");
#
my %dict_aa = pdf_manipulate::pdf_to_dict_proc ($file_pdf);

text_manipulate::dict_display_proc (%dict_aa);

print	(encode ('utf-8',"*** 終了 ***\n"));
 
exit 0;
# ----------------------------------------------------------------
