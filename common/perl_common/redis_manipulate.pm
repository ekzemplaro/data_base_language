#! /usr/bin/perl
#
#	redis_manipulate.pm
#
#						Jun/17/2011
#
#
# ----------------------------------------------------------------
package	redis_manipulate;
use	strict;
use	warnings;
use	utf8;
use	Encode;
use	JSON;
# ----------------------------------------------------------------
sub	redis_display_proc
{
	my $rr = $_[0];
	my $key = $_[1];
my @keys = ('t1851','t1852','t1853',
	't1854','t1855','t1856',
	't1857','t1858','t1859');
foreach (@keys)
	{
	my $ikey = $_;
	if ($rr->exists($ikey))
		{
		my $json_str = $rr->get($ikey);
		my $json_str_bb = (encode ('utf-8',$json_str));
		kvalue_manipulate::json_display_proc ($ikey,$json_str_bb);
		}
	}
}

# ----------------------------------------------------------------
sub	redis_update_proc
{
	my $rr = $_[0];
	my $id_in = $_[1];
	my $population_in = $_[2];

if ($rr->exists($id_in))
	{
	my $json_str=$rr->get($id_in);
#	print $json_str . "\n";
	my $data=decode_json (encode ('utf-8',$json_str));

	my $name_in = $data->{name};
	my $today = text_manipulate::get_date_mod_proc ();

	my $data_out = {'name'=>$name_in,'population'=>$population_in,'date_mod'=>$today};

	my $str_json_new = encode_json ($data_out);
	$str_json_new = decode ('utf-8',$str_json_new);
#	print $str_json_new . "\n";

	$rr->set ($id_in => $str_json_new);
	}

}

# ----------------------------------------------------------------
1;
# ----------------------------------------------------------------
#
