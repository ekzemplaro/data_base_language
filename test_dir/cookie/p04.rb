#! /usr/bin/ruby

require "cgi"
cgi = CGI.new("html4")
cookie = CGI::Cookie.new(
	{'name' => 'aa', 'value' => 'PPPP', 'expires' => Time.now + 3600},
	{'name' => 'bb', 'value' => 'FF', 'expires' => Time.now + 3600},
	{'name' => 'cc', 'value' => 'GG', 'expires' => Time.now + 3600})
cgi.out('cookie' => cookie[1]) do
   cgi.head + cgi.body { "Cookie stored" }
end
