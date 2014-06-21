#! /usr/bin/perl
#
#	jquery_perl/create/mongo_perl_create.pl
#
#
#						Jun/25/2012
#
# ----------------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use	JSON;
use	Encode;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use mongo_manipulate;
#
# ----------------------------------------------------------------------
my %dict_aa = data_prepare_proc ();
#
print "Content-type: text/html\n\n";
#
my $conn = MongoDB::Connection->new( host => 'localhost', port => 27017 );
my $db   = $conn->city_db;
my $col = $db -> saitama;
#
mongo_manipulate::dict_to_mongo_proc ($col,%dict_aa);
#
print "*** OK ***\n";
# ----------------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;
	%dict_aa = text_manipulate::dict_append_proc
		('t1161','さいたま',84200,'2005-6-24',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1162','所沢',14500,'2005-4-15',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1163','越谷',58600,'2005-10-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1164','久喜',46300,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1165','熊谷',27100,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1166','秩父',92600,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1167','川越',35700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1168','和光',85300,'2005-10-8',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t1169','新座',64800,'2005-5-21',%dict_aa);

	return	%dict_aa;
}

# ----------------------------------------------------------------------
