#! /usr/bin/perl
#
#	firebird_update.pl
#
#						May/18/2012
#
# ----------------------------------------------------------------
use	DBI;
use	strict;
use	warnings;
use	utf8;
use	Encode;

use lib '/var/www/data_base/common/perl_common';
use sql_manipulate;
use text_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
my $id_in = $ARGV[0];
my $population_in = $ARGV[1];
#
print ("$id_in\t$population_in\n");
#
#
my $host     = 'localhost';
my $dbpath   = '/var/tmp/firebird/cities.fdb';
my $user     = 'SYSDBA';
my $password = 'tiger';
#
#my $data_source = 'dbi:InterBase:' . "host=$host;dbname=$dbpath";
my $data_source = 'dbi:Firebird:' . "host=$host;dbname=$dbpath";

my $dbh = DBI->connect($data_source, $user, $password);
unless($dbh) {
	print STDERR "Error : connect.\n";
	exit -1;
}

sql_manipulate::dbi_update_proc ($id_in,$population_in,$dbh);

$dbh->disconnect();

print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
