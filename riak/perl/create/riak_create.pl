#! /usr/bin/perl
#
#	riak_create.pl
#
#					Sep/22/2015
# -------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;
#
use lib '/var/www/data_base/common/perl_common';
use text_manipulate;
use uri_get;
use file_io;
#
# -------------------------------------------------------
print (encode ('utf-8',"*** 開始 ***\n"));
#
#
my $url_base = 'http://host_ubuntu:8098/riak/shimane';
#

my %dict_aa = data_prepare_proc ();
#
#
foreach my $key (sort keys %dict_aa)
	{
	my $json_str = encode_json ($dict_aa{$key});
	my $url_target = $url_base . "/" . $key;
	uri_get::uri_put_proc ($url_target,$json_str);
	}
#
print (encode ('utf-8',"*** 終了 ***\n"));
#
# -------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t3251','松江',71842,'2005-6-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3252','出雲',14378,'2005-3-5',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3253','大田',58641,'2005-9-7',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3254','雲南',46832,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3255','江津',28749,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3256','浜田',27538,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3257','益田',35867,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3258','安来',87256,'2005-10-8',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------
