#! /usr/bin/perl
#
#	delete/text_delete.pl
#
#					Jan/24/2011
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
# ----------------------------------------------------------------
#
my $file_text = $ARGV[0];
my $id_in = $ARGV[1];
print	$id_in . "\n";
#
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my %hash = text_manipulate::text_read_proc ($file_text);

%hash = text_manipulate::dict_delete_proc ($id_in,%hash);

text_manipulate::dict_display_proc (%hash);
#
text_manipulate::text_write_proc ($file_text,%hash);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
#
# ----------------------------------------------------------------------
