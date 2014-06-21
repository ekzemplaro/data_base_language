#! /usr/bin/perl
#
#	riak_perl_create.pl
#
#						Apr/12/2013
#
# -------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
#
use LWP::UserAgent;
use	Encode;
use	JSON;
#
#
use lib '/var/www/data_base/common/perl_common';
use uri_get;
use text_manipulate;
#
# -------------------------------------------------------------
my $url_base = 'http://localhost:8098/riak/shimane';
#
print "Content-type: text/json\n\n";
#
my %dict_aa = data_prepare_proc ();
#
foreach my $key (sort keys %dict_aa)
	{
	print $key . "\n";
	my $json_str = encode_json ($dict_aa{$key});
	print $json_str . "\n";
	my $url_target = $url_base . "/" . $key;
	uri_get::uri_put_proc ($url_target,$json_str);
	}
#
#
print "*** OK ***\n";
#
# -------------------------------------------------------------
sub data_prepare_proc
{
	my %dict_aa;

	%dict_aa = text_manipulate::dict_append_proc
		('t3251','松江',42500,'2005-7-17',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3252','出雲',37800,'2005-2-5',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3253','大田',58100,'2005-4-7',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3254','雲南',43200,'2005-8-22',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3255','江津',28700,'2005-2-28',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3256','浜田',23800,'2005-5-9',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3257','益田',36700,'2005-4-10',%dict_aa);
	%dict_aa = text_manipulate::dict_append_proc
		('t3258','安来',87600,'2005-10-8',%dict_aa);

	return	%dict_aa;
}

# -------------------------------------------------------------
