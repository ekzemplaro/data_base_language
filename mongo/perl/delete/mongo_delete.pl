#! /usr/bin/perl
#
#	mongo_delete.pl
#
#					Jun/25/2012
#
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;

use	MongoDB;
use	MongoDB::OID;

use lib '/var/www/data_base/common/perl_common';
use mongo_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
my $id_in = $ARGV[0];
#
print ("$id_in\n");
#
my $conn = MongoDB::Connection->new( host => 'localhost', port => 27017 );
my $db   = $conn->city_db;
my $col = $db -> saitama;

mongo_manipulate::mongo_delete_proc ($col,$id_in);

print	(encode ('utf-8',"*** 終了 ***\n"));
exit 0;
# ----------------------------------------------------------------
