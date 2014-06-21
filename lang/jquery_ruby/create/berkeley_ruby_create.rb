#! /usr/bin/ruby1.8
# -*- encoding: utf-8 -*-
#
#	berkeley_ruby_create.rb
#
#					Mar/22/2013
# -------------------------------------------------------------
require	'bdb'
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
db_file="/var/tmp/berkeley/cities.db"
File.unlink(db_file)
dd = BDB::Btree::open(db_file,"table1","w",0777)
#
dd["t2451"]='{"name": "津","population": 81200,"date_mod": "2006-7-22"}'
dd["t2452"]='{"name": "鈴鹿","population": 75300,"date_mod": "2006-9-17"}'
dd["t2453"]='{"name": "伊勢","population": 42400,"date_mod": "2006-1-14"}'
dd["t2454"]='{"name": "鳥羽","population": 84600,"date_mod": "2006-2-2"}'
dd["t2455"]='{"name": "四日市","population": 91200,"date_mod": "2006-1-15"}'
dd["t2456"]='{"name": "亀山","population": 73100,"date_mod": "2006-7-12"}'
dd["t2457"]='{"name": "尾鷲","population": 86700,"date_mod": "2006-11-21"}'
dd["t2458"]='{"name": "桑名","population": 52300,"date_mod": "2006-10-11"}'
dd["t2459"]='{"name": "志摩","population": 42600,"date_mod": "2006-8-22"}'
dd["t2460"]='{"name": "伊賀","population": 35800,"date_mod": "2006-12-4"}'
dd["t2461"]='{"name": "名張","population": 84100,"date_mod": "2006-5-12"}'
dd["t2462"]='{"name": "熊野","population": 76300,"date_mod": "2006-11-18"}'
#
dd.close
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
