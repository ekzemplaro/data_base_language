#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	gdbm_ruby_create.rb
#
#					Oct/07/2010
# -------------------------------------------------------------
require	'dbm'
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
dd=DBM.new("/var/tmp/gdbm/cities")
#
dd["t2151"]='{"name": "岐阜","population": 81900,"date_mod": "2006-5-25"}';
dd["t2152"]='{"name": "大垣","population": 12700,"date_mod": "2006-9-12"}';
dd["t2153"]='{"name": "多治見","population": 52500,"date_mod": "2006-7-14"}';
dd["t2154"]='{"name": "各務原","population": 63200,"date_mod": "2006-4-02"}';
dd["t2155"]='{"name": "土岐","population": 23500,"date_mod": "2006-5-21"}';
dd["t2156"]='{"name": "高山","population": 32100,"date_mod": "2006-10-12"}';
dd["t2157"]='{"name": "美濃加茂","population": 83400,"date_mod": "2006-5-24"}';
dd["t2158"]='{"name": "恵那","population": 42300,"date_mod": "2006-3-11"}';
dd["t2159"]='{"name": "関","population": 63700,"date_mod": "2006-10-21"}';
dd["t2160"]='{"name": "中津川","population": 82400,"date_mod": "2006-10-17"}';
dd.close
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
