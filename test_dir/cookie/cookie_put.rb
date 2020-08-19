#! /usr/bin/ruby
#
#	cookie_put.rb
#
#
puts "Set-Cookie: message='Good Morning';\n"
puts "Set-Cookie: aa='おはようございます。';\n"
puts "Set-Cookie: bb='今日は晴れています。';\n"
puts "Set-Cookie: cc='こんにちは';\n"
puts 'Content-Type: text/html',"\n"
puts "\n"

puts "<!DOCTYPE html>"
puts "<html lang=\"ja\">"
puts "<head>"
puts "<title>cookie put</title>"
puts "</head>"
puts "<body>"
puts "cookie_put.rb<p />"
puts "Aug/15/2020<p/>"
puts "</body>"
puts "</html>"
