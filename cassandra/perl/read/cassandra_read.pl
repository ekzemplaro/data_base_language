#! /usr/bin/perl
#
#	cassandra_read.pl
#
#					May/25/2010
#
use warnings;
use Data::Dumper;
use Net::Cassandra;

# -------------------------------------------------------------------
sub get_value_proc
{
	my $cassandra  = $_[0];
	my $client  = $_[1];
	my $key  = $_[2];
	my $column_in  = $_[3];

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
	my $cassandra  = $_[0];
	my $client  = $_[1];
	my $ikey  = $_[2];

#
	my $value = get_value_proc ($cassandra,$client,$ikey,'name');
	my $value_pp = get_value_proc ($cassandra,$client,$ikey,'population');
	my $value_dd = get_value_proc ($cassandra,$client,$ikey,'date_mod');
#
	print $ikey,"\t",$value ,"\t", $value_pp, "\t",$value_dd,"\n";
}
#
# -------------------------------------------------------------------
sub cassandra_display_proc
{
	my $cassandra  = $_[0];
	my $client  = $_[1];

	for (my $ikey=431; $ikey <=439; $ikey++)
		{
		cassandra_single_display_proc ($cassandra,$client,$ikey);
		}
}

# -------------------------------------------------------------------
my $cassandra = Net::Cassandra->new( hostname => 'localhost' );
my $client    = $cassandra->client;
#
cassandra_display_proc ($cassandra,$client);
#
# -------------------------------------------------------------------
