#! /usr/bin/perl
#
#
#					May/25/2010
#
use warnings;
use Data::Dumper;
use Net::Cassandra;

# -------------------------------------------------------------------
sub insert_proc
{
	my $client = $_[0];
	my $key_in = $_[1];
	my $value_in = $_[2];
	my $timestamp = $_[3];

  eval {
      $client->insert(
          'Keyspace1',$key_in,
          Net::Cassandra::Backend::ColumnPath->new(
              { column_family => 'Standard1', column => 'name' }),
		$value_in,$timestamp,
          Net::Cassandra::Backend::ConsistencyLevel::ZERO
      );
  };
}

# -------------------------------------------------------------------
sub delete_proc
{
	my $client = $_[0];
	my $key = $_[1];
	my $timestamp = $_[2];

	eval {
      $client->remove(
          'Keyspace1',
          $key,
          Net::Cassandra::Backend::ColumnPath->new(
              { column_family => 'Standard1', column => 'name' }
          ),
          $timestamp
      );
  };
}

# -------------------------------------------------------------------

print "*** start ***\n";

	my $cassandra = Net::Cassandra->new( hostname => 'localhost' );
	my $client    = $cassandra->client;

	my $key = '24123';
	my $timestamp = time;

insert_proc ($client,$key,"Herman Hesse",$timestamp);
insert_proc ($client,'24124',"Thomas Mann",$timestamp);

  die $@->why if $@;

print "*** check fff ***\n";

  eval {
      my $what = $client->get(
          'Keyspace1',
          $key,
          Net::Cassandra::Backend::ColumnPath->new(
              { column_family => 'Standard1', column => 'name' }
          ),
          Net::Cassandra::Backend::ConsistencyLevel::QUORUM
      );
      my $value     = $what->column->value;
      my $timestamp = $what->column->timestamp;
#      warn "$value / $timestamp";
	print "$value / $timestamp\n";
  };
#  die $@->why if $@;

#delete_proc ($client,$key,$timestamp);

#  die $@->why if $@;
print "*** end ***\n";
