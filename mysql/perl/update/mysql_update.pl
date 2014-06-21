#! /usr/bin/perl
#
#	mysql/perl/update/mysql_update.pl
#
#					May/19/2011
#
# -----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use DBI;
use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
# -----------------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
#
print ("$id_in\t$population_in\n");
#
my $constr = 'DBI:mysql:city:host_mysql';
my $user = 'scott';
my $passwd = 'tiger';
my $dbi = DBI->connect($constr, $user, $passwd);
#
sql_manipulate::mysql_utf8_proc ($dbi);
#
sql_manipulate::dbi_update_proc ($id_in,$population_in,$dbi);
#
#
sql_manipulate::sql_show_proc ($dbi);
$dbi->disconnect;
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# -----------------------------------------------------------------------
