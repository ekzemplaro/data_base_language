#! /usr/bin/perl
#
#	mongo_manipulate.pm
#
#					Jun/25/2012
#
# ----------------------------------------------------------------
package	mongo_manipulate;
# ----------------------------------------------------------------
use	strict;
use	warnings;
use	utf8;
use	Encode;

use	MongoDB;
use	MongoDB::OID;

# ----------------------------------------------------------------
sub mongo_to_dict_proc
{
	my ($col) = @_;

	my %dict_aa;

	my $cursor = $col -> find();
	while(my $obj = $cursor -> next) {
		my $key = $obj -> {id};
		my %dict_unit = ("name"=> $obj -> {name},
			"population" => $obj -> {population},
			"date_mod" => $obj -> {date_mod});

		$dict_aa{$key} = \%dict_unit;
		}

	return	%dict_aa;
}

# ----------------------------------------------------------------
sub dict_to_mongo_proc
{
	my ($col,%dict_aa) = @_;

	print ($col->count . "\n");
	$col->remove;
	print ($col->count . "\n");

	foreach my $key (sort keys %dict_aa){
		my %unit_aa;
		$unit_aa{"id"} = $key;
		$unit_aa{"name"} = ${$dict_aa{$key}}{"name"};
		$unit_aa{"population"} = ${$dict_aa{$key}}{"population"};
		$unit_aa{"date_mod"} = ${$dict_aa{$key}}{"date_mod"};

		$col->save (\%unit_aa);
		}
}

# ----------------------------------------------------------------
sub mongo_update_proc
{
	my ($col,$id_in,$population_in) = @_;

	print ($col->count . "\n");

	my $cursor = $col -> find({'id' => $id_in});

	while(my $obj = $cursor -> next) {
		my $out_str = $obj -> {id} . "\t";
		$out_str .= $obj -> {name} . "\t";
		$out_str .= $obj -> {population} . "\t";
		$out_str .= $obj -> {date_mod} . "\n";
		print (encode ('utf-8',$out_str));
#
		$obj -> {population} = $population_in;
		$obj -> {date_mod} = text_manipulate::get_date_mod_proc ();
		$col->save ($obj);
		}
}

# ----------------------------------------------------------------
sub mongo_delete_proc
{
	my ($col,$id_in) = @_;

	print ($col->count . "\n");

	my $cursor = $col -> find({'id' => $id_in});

	while(my $obj = $cursor -> next) {
		my $out_str = $obj -> {id} . "\t";
		$out_str .= $obj -> {name} . "\t";
		$out_str .= $obj -> {population} . "\t";
		$out_str .= $obj -> {date_mod} . "\n";
		print (encode ('utf-8',$out_str));

		$col->remove ($obj);
		}
}

# ----------------------------------------------------------------
1;
# ----------------------------------------------------------------
