#! /usr/bin/perl
#
#	cassandra_update.pl
#
#					May/25/2010
#
use warnings;
use Data::Dumper;
use Net::Cassandra;

# -------------------------------------------------------------------
sub get_value_proc
{
	my $client  = $_[0];
	my $key  = $_[1];
	my $column_in  = $_[2];

    my $what = $client->get(
        'Keyspace1',
	$key,
	Net::Cassandra::Backend::ColumnPath->new(
		{ column_family => 'Standard2', column => $column_in }
	),
	Net::Cassandra::Backend::ConsistencyLevel::QUORUM
	);
	my $value = $what->column->value;

	return	$value;
}

# -------------------------------------------------------------------
sub cassandra_single_display_proc
{
	my $client  = $_[0];
	my $ikey  = $_[1];

#
	my $value = get_value_proc ($client,$ikey,'name');
	my $value_pp = get_value_proc ($client,$ikey,'population');
	my $value_dd = get_value_proc ($client,$ikey,'date_mod');
#
	print $ikey,"\t",$value ,"\t", $value_pp, "\t",$value_dd,"\n";
}
#
# -------------------------------------------------------------------
sub cassandra_display_proc
{
	my $client  = $_[0];

	for (my $ikey=431; $ikey <=439; $ikey++)
		{
		cassandra_single_display_proc ($client,$ikey);
		}
}

# -------------------------------------------------------------------
sub insert_value_proc
{
	my $client = $_[0];
	my $key_in = $_[1];
	my $value_in = $_[2];
	my $timestamp = time;

	print "insert_value_proc\t";
	print $key_in,"\t",$value_in,"\t";
	print $timestamp,"\n";

	eval {$client->insert('Keyspace1',$key_in,
	Net::Cassandra::Backend::ColumnPath->new(
		{ column_family => 'Standard2', column => 'population' }),
		$value_in,$timestamp,
	Net::Cassandra::Backend::ConsistencyLevel::ZERO
	);
};
}

# -------------------------------------------------------------------
sub cassandra_update_proc
{
	my $client  = $_[0];
	my $id  = $_[1];
	my $population  = $_[2];

	insert_value_proc ($client,$id,$population);

	for (my $ikey=431; $ikey <=439; $ikey++)
		{
#		print $id,"\t",$ikey,"\n";
		if ($id == $ikey)
			{
			print "cassandra_update_proc\t";
			print $id,"\t",$population,"\n";
			}
		}
}

# -------------------------------------------------------------------
my $cassandra = Net::Cassandra->new( hostname => 'localhost' );
my $client    = $cassandra->client;
#
cassandra_update_proc ($client,436,323000);
cassandra_update_proc ($client,437,151000);
#
cassandra_display_proc ($client);
#
# -------------------------------------------------------------------
