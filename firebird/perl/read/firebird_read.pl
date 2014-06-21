#! /usr/bin/perl
#
#	firebird_read.pl
#
#						Jun/19/2012
#
# ----------------------------------------------------------------
use	DBI;
use	strict;
use	warnings;
use	utf8;
use	Encode;

use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use firebird_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
# パラメータ設定
my $host     = 'localhost';
my $dbpath   = '/var/tmp/firebird/cities.fdb';
my $user     = 'SYSDBA';
my $password = 'tiger';
#
#
my $data_source = 'dbi:Firebird:' . "host=$host;dbname=$dbpath";

my $dbh = DBI->connect($data_source, $user, $password);
unless($dbh) {
	print STDERR "Error : connect.\n";
	exit -1;
}
#
my %dict_aa = firebird_manipulate::firebird_to_dict_proc ($dbh);
$dbh->disconnect;
text_manipulate::dict_display_proc (%dict_aa);
#
print	(encode ('utf-8',"*** 終了 ***\n"));
# ----------------------------------------------------------------
