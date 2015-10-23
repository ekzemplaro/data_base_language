#! /usr/bin/perl
#
#	mcache_manipulate.pm
#
#						Nov/11/2010
#
#
# ----------------------------------------------------------------
package	mcache_manipulate;
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;
# ----------------------------------------------------------------
sub	mcache_display_proc
{
	my $memcached = $_[0];
	my $key = $_[1];
	my $str_json = "";
	$str_json = $memcached->get($key);
#
	if ($str_json)
		{
#		print "$key\t$str_json\n";
		kvalue_manipulate::json_display_proc ($key,$str_json);
		}
}

# ----------------------------------------------------------------
sub	mcache_update_proc
{
	my $memcached = $_[0];
	my $id_in = $_[1];
	my $population_in = $_[2];

	print ("$id_in\t$population_in\n");
	my $str_json = $memcached->get($id_in);

	if ($str_json)
	{
	print $str_json;
	my $data= decode_json ($str_json);

	my $date_mod = text_manipulate::get_date_mod_proc ();

	print	$id_in . "\t" . $data->{'population'} . "\n";
	$data->{'population'} = $population_in;
	$data->{'date_mod'} = $date_mod;
	print	$id_in . "\t" . $data->{'population'};
	print	"\t" . $data->{'date_mod'} . "\n";

	my $json = encode_json ($data);
	print	$json . "\n";
	$memcached->set($id_in,$json);

	}
}

# ----------------------------------------------------------------
1;
# ----------------------------------------------------------------
#
