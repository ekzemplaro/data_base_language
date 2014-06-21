#! /usr/bin/perl
#
#	perl_common/uri_get.pm
#
#					Nov/01/2013
#
#
# -------------------------------------------------------------------
package	uri_get;
#
use     strict;
use     warnings;
#
use	Encode;
use WWW::Curl::Easy;
use HTTP::Request;
use LWP::UserAgent;
#
# -------------------------------------------------------------------
sub	uri_get_proc
{
my $uri = $_[0];
my $str_json = "";
#
my $curl = new WWW::Curl::Easy;
#
#$curl->setopt(CURLOPT_HEADER,1);

#
$curl->setopt(CURLOPT_PROXY, '');
$curl->setopt(CURLOPT_URL, $uri);

my $response_body = "";
open (my $fileb, ">", \$response_body);

$curl->setopt(CURLOPT_WRITEDATA,$fileb);

my $retcode = $curl->perform;

if ($retcode == 0)
	{
	my $code = $curl->getinfo(CURLINFO_HTTP_CODE);
	}
else
	{
	print "Bad luck this time\n";
	}

	return	$response_body;
}

# -------------------------------------------------------------------
sub uri_put_proc
{
	my ($url_aa,$str_in) = @_;

#	print "*** uri_put_proc *** start  ***\n";
#
	my $ua   = new LWP::UserAgent;
#
	my $request = new HTTP::Request(PUT => $url_aa);
#	my $body    = encode ('utf-8',$str_in);
	my $body    = $str_in;
	$request->content($body);
	$request->header('Content-Type' => 'application/json');
#
	my $response = $ua->request($request);
#
#	print $response->content();
#	print "*** uri_put_proc *** end ***\n";
}
#
# -------------------------------------------------------------------
sub uri_delete_proc
{
	my ($url_aa) = @_;

	print "*** uri_delete_proc *** start  ***\n";
	print $url_aa . "\n";
#
	my $ua   = new LWP::UserAgent;
#
	my $request = new HTTP::Request(DELETE => $url_aa);
	my $response = $ua->request($request);
	print $response->content();
	print "*** uri_delete_proc *** end ***\n";
}
# -------------------------------------------------------------------
1;
# -------------------------------------------------------------------
