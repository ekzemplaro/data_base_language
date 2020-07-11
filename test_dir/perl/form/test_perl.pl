#! /usr/bin/perl
#
#	test_perl.pl
#
#					Jul/10/2020
#
use strict;
use warnings;
use CGI;
#
print "Content-type: text/html\n\n";
print "<html>\n";
print "<head>\n";
print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n";
print "<title>CGI テスト</title>\n";
print "</head>\n";
print "<body>\n";
print "CGI テスト<p />\n";
#
my $q = new CGI;
for my $param_name ($q->param) {
	print $param_name . ' = ' . $q->param($param_name) . '<p />';
}

#
print "<p />\n";
print "Jul/10/2020<p />\n";
print "</body>\n";
print "</html>\n";
