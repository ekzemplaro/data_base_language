#! /usr/bin/perl
#
#	mongo_create.pl
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
use text_manipulate;
use mongo_manipulate;
# ----------------------------------------------------------------
print	(encode ('utf-8',"*** 開始 ***\n"));
#
my %dict_aa = data_prepare_proc ();
#
my $conn = MongoDB::Connection->new( host => 'localhost', port => 27017 );
my $db   = $conn->city_db;
my $col = $db -> saitama;

mongo_manipulate::dict_to_mongo_proc ($col,%dict_aa);

print	(encode ('utf-8',"*** 終了 ***\n"));
exit 0;

# ----------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t1161','さいたま',84236,'2005-6-2',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1162','所沢',14278,'2005-2-25',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1163','越谷',58641,'2005-7-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1164','久喜',46432,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1165','熊谷',27349,'2005-9-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1166','秩父',92843,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1167','川越',34682,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1168','和光',85276,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1169','新座',29531,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------
