#! /usr/bin/perl
#
#	morning.pl
#
#
use strict;
use warnings;
#
#open (STDERR, ">>./logs/error.txt" );
open (STDERR, ">./logs/error.txt" );
#
print STDERR ("*** morning.pl *** start ***\n");
#
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head>\n";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n";
print "<title>Hello by Perl</title>\n";
print "</head>\n";
print "<body>\n";
print "Good Morning<p />\n";
print "おはようございます。<p />\n";
print "Jul/01/2020 AM 10:22<p />\n";
print "</body>\n";
print "</html>\n";
#
my ($mday,$mon,$year) = (localtime (time))[3..5];
$mon += 1;
$year += 1900;
my $date_mod = "$year-$mon-$mday";

print STDERR ($date_mod . "\n");
print STDERR ("*** morning.pl *** end ***\n");
#
close(STDERR);
