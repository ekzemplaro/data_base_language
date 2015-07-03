#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	berkeley_create.rb
#
#					Jun/07/2011
#
# -------------------------------------------------------------
require 'bdb'
# -------------------------------------------------------------
puts "*** 開始 ***"
#
db_file = ARGV[0]
#
File.unlink(db_file)
dd = BDB::Btree::open(db_file,"table1","w",0777)
#dd = BDB::Hash::open(db_file,"table1","w",0777)
#
dd["t2451"]='{"name": "津","population": 81237,"date_mod": "2006-9-12"}'
dd["t2452"]='{"name": "鈴鹿","population": 26874,"date_mod": "2006-5-27"}'
dd["t2453"]='{"name": "伊勢","population": 42915,"date_mod": "2006-1-14"}'
dd["t2454"]='{"name": "鳥羽","population": 84631,"date_mod": "2006-2-2"}'
dd["t2455"]='{"name": "四日市","population": 71234,"date_mod": "2006-1-15"}'
dd["t2456"]='{"name": "亀山","population": 72139,"date_mod": "2006-7-12"}'
dd["t2457"]='{"name": "尾鷲","population": 83764,"date_mod": "2006-11-21"}'
dd["t2458"]='{"name": "桑名","population": 59341,"date_mod": "2006-10-11"}'
dd["t2459"]='{"name": "志摩","population": 41632,"date_mod": "2006-8-22"}'
dd["t2460"]='{"name": "伊賀","population": 36578,"date_mod": "2006-12-4"}'
dd["t2461"]='{"name": "名張","population": 89425,"date_mod": "2006-5-12"}'
dd["t2462"]='{"name": "熊野","population": 72347,"date_mod": "2006-10-8"}'


dd.each { |kk,vv| puts kk + "\t" + vv}
dd.close()

File.chmod(0777,db_file)
#
print ("*** 終了 ***\n")
#
# -------------------------------------------------------------
