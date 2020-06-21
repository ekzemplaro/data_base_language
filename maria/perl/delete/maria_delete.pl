#! /usr/bin/perl
#
#	maria_delete.pl
#
#					Jun/21/2020
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
#
use DBI;
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
# -----------------------------------------------------------------------
print STDERR (encode ('utf-8',"*** 開始 ***\n"));
#
my $id_in = $ARGV[0];
#
print ("$id_in\n");
#
my $constr = 'DBI:mysql:city:localhost';
my $user = 'scott';
my $passwd = 'tiger123';
my $dbi = DBI->connect($constr, $user, $passwd);
#
sql_manipulate::mysql_utf8_proc ($dbi);
#
sql_manipulate::dbi_delete_proc ($id_in,$dbi);
#
$dbi->disconnect;
#
print STDERR (encode ('utf-8',"*** 終了 ***\n"));
# -----------------------------------------------------------------------
