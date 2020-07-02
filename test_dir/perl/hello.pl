#! /usr/bin/perl
#
#	hello.pl
#
#
use strict;
use warnings;
#
open (STDERR, ">>./logs/error.txt" );
#
print STDERR ("*** hello.pl *** start ***\n");
#
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head>\n";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n";
print "<title>Hello by Perl</title>\n";
print "</head>\n";
print "<body>\n";
print "Hello<p />\n";
print "こんにちは<p />\n";
print "Jul/01/2020 AM 10:19<p />\n";
print "</body>\n";
print "</html>\n";
#
print STDERR ("*** hello.pl *** end ***\n");
#
close(STDERR);
