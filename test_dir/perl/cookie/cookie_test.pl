#! /usr/bin/perl
#
#	hello.pl
#
#
use strict;
use warnings;
#
#
print STDERR ("*** hello.pl *** start ***\n");
my $cookie = "表\示されましたか？";
$cookie =~ s/(\W)/sprintf("%%%02X", unpack("C", $1))/eg;
#
print "Content-type: text/html\n\n";
#print "Set-Cookie: CookieTest=%83e%83X%83g; expires=Tue, 15-Aug-2020 11:30:00 GMT;";
print "Set-Cookie: test=$cookie\n\n";
print "書き込み終了";
print "<html>\n";
print "<head>\n";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n";
print "<title>Hello by Perl</title>\n";
print "</head>\n";
print "<body>\n";
print "Hello<p />\n";
print "こんにちは<p />\n";
print "Aug/13/2020 AM 10:19<p />\n";
print "</body>\n";
print "</html>\n";
#
print STDERR ("*** hello.pl *** end ***\n");
#
