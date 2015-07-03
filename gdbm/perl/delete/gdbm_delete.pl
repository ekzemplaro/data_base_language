#! /usr/bin/perl
#
#	gdbm_delete.pl
#
#					Jun/11/2015
#
# ------------------------------------------------------------
use	strict;
use	warnings;

# use lib '/var/www/data_base/common/perl_common';
#use kvalue_manipulate;
#use text_manipulate;
#
#
# ------------------------------------------------------------
my $db_file=$ARGV[0];
#
print	"*** 開始 ***\n";
my $key_in = $ARGV[1];
print ("$key_in\n");
#
dbmopen (my %dd,$db_file,0644) || die "cannot open DBM";
#
delete ($dd{$key_in});
#
dbmclose (%dd);
#
print	"*** 終了 ***\n";
#
# ------------------------------------------------------------
