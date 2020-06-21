#! /usr/bin/perl
#
#	maria_read.pl
#
#					Jun/21/2020
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	DBI;
#
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
#
# -----------------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $constr='DBI:mysql:city:localhost';
my $user = 'scott';
my $passwd = 'tiger123';
#
my $dbi=DBI->connect($constr, $user, $passwd);
# print $DBI::errstr;
#
sql_manipulate::mysql_utf8_proc ($dbi);
my %dict_aa = sql_manipulate::sql_to_dict_proc ($dbi);
#
$dbi->disconnect;
#
text_manipulate::dict_display_proc (%dict_aa);
print	(encode ('utf-8',"*** 終了 ***\n"));
# -----------------------------------------------------------------------
