#! /usr/bin/perl
#
#	tcbn_manipulate.pm
#
#					Sep/21/2010
# ----------------------------------------------------------
package	tcbn_manipulate;
# ----------------------------------------------------------
use	TokyoCabinet;
use	strict;
use	warnings;
use	Encode;
use	JSON;
use	utf8;
#
# ----------------------------------------------------------
sub record_out_proc
{
	my $bdb =$_[0];
	my $id_in =$_[1];
	my $name_in =$_[2];
	my $population_in =$_[3];
	my $date_mod_in =$_[4];

	my $data_out = {'name'=>$name_in,'population'=>$population_in,'date_mod'=>$date_mod_in};

	my $str_json = encode_json ($data_out);

	if(!$bdb->put($id_in, $str_json))
		{
		my $ecode = $bdb->ecode();
		printf STDERR ("put error: %s\n", $bdb->errmsg($ecode));
		}
}

# ----------------------------------------------------------
sub data_update_proc
{
	my $bdb =$_[0];
	my $id_in =$_[1];
	my $population_in =$_[2];

	my $json_str = $bdb->get($id_in);

	my $data=decode_json ($json_str);
	my $name = $data->{name};
	my $date_mod = text_manipulate::get_date_mod_proc ();

	record_out_proc ($bdb,$id_in,$name,$population_in,$date_mod);
}

# ----------------------------------------------------------
1;
# ----------------------------------------------------------
