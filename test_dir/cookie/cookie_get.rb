#! /usr/bin/ruby
#
#	cookie_get.rb
#
cookie = Hash.new
ENV['HTTP_COOKIE'].split(/;\s/).each do |bo|
  mo = bo.split(/=/)
  cookie[mo[0]] = mo[1]
end

puts "Content-type: text/html\n\n"
puts "<!DOCTYPE html>"
puts "<html lang=\"ja\">"
puts "<head>"
puts "<meta http-equiv=\"CONTENT-TYPE\" content=\"text/html; charset=utf-8\" />"
puts "<title>Cookie Test</title></head>"
puts "<body>"

puts "Cookie Test<p />"
# puts cookie
cookie.each {|key, value|
	puts key,":",value,"<p />"
	}
puts "</body></html>"
